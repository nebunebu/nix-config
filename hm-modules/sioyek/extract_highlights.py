#!/usr/bin/env python3
"""
Extract highlights for a single PDF from Sioyek's databases.

Sioyek stores:
  - local.db : table `document_hash` mapping file paths -> md5 hash
  - shared.db: table `highlights` keyed by that md5 (field `document_path`)
Docs: https://sioyek-documentation.readthedocs.io/en/latest/scripting.html

This script is intentionally defensive:
  - It discovers column names via PRAGMA (schema can vary across builds/versions)
  - If it can't find the md5 in local.db, it falls back to md5(file contents)
  - Page grouping is optional; if PyMuPDF isn't installed, it still works (no pages)
"""

from __future__ import annotations

import argparse
import bisect
import hashlib
import json
import os
import sqlite3
import sys
from dataclasses import dataclass
from typing import Any, Dict, Iterable, List, Optional, Tuple

from .sioyek import Sioyek


def clean_path(path: str) -> str:
    if not path:
        return ""
    return path.strip('"').strip("'")


@dataclass(frozen=True)
class Highlight:
    text: str
    htype: Optional[str]
    begin_x: Optional[float]
    begin_y: Optional[float]
    end_x: Optional[float]
    end_y: Optional[float]
    page: Optional[int] = None  # 1-indexed for humans


def expand_user(path: str) -> str:
    return os.path.abspath(os.path.expanduser(path))


def default_sioyek_data_dir() -> str:
    xdg_data = os.environ.get("XDG_DATA_HOME")
    if xdg_data:
        return os.path.join(expand_user(xdg_data), "sioyek")
    return os.path.join(expand_user("~/.local/share"), "sioyek")


def open_sqlite_ro(db_path: str) -> sqlite3.Connection:
    # URI read-only mode prevents accidental writes (great power / responsibility…)
    uri = f"file:{db_path}?mode=ro"
    return sqlite3.connect(uri, uri=True)


def table_exists(conn: sqlite3.Connection, table: str) -> bool:
    row = conn.execute(
        "SELECT 1 FROM sqlite_master WHERE type='table' AND name=? LIMIT 1",
        (table,),
    ).fetchone()
    return row is not None


def table_columns(conn: sqlite3.Connection, table: str) -> List[str]:
    cols = []
    for cid, name, ctype, notnull, dflt, pk in conn.execute(
        f"PRAGMA table_info({table})"
    ):
        cols.append(name)
    return cols


def pick_first(existing: Iterable[str], candidates: Iterable[str]) -> Optional[str]:
    s = set(existing)
    for c in candidates:
        if c in s:
            return c
    return None


def md5_file(path: str, chunk_size: int = 1024 * 1024) -> str:
    h = hashlib.md5()
    with open(path, "rb") as f:
        while True:
            b = f.read(chunk_size)
            if not b:
                break
            h.update(b)
    return h.hexdigest()


def find_db_paths(
    args_local: Optional[str], args_shared: Optional[str]
) -> Tuple[str, str]:
    if args_local and args_shared:
        return (expand_user(args_local), expand_user(args_shared))

    base = default_sioyek_data_dir()
    local_db = expand_user(args_local) if args_local else os.path.join(base, "local.db")
    shared_db = (
        expand_user(args_shared) if args_shared else os.path.join(base, "shared.db")
    )

    if not os.path.exists(local_db) or not os.path.exists(shared_db):
        # Fallback: some setups might use a single DB file (older/packaged variants).
        # We'll try sioyek.db if present and treat it as both.
        one_db = os.path.join(base, "sioyek.db")
        if os.path.exists(one_db):
            return (one_db, one_db)

    return (local_db, shared_db)


def lookup_document_md5(local_conn: sqlite3.Connection, pdf_path: str) -> Optional[str]:
    """
    Try to read the md5 hash for this PDF from local.db's document_hash table.
    Column names vary; we discover them.
    """
    if not table_exists(local_conn, "document_hash"):
        return None

    cols = table_columns(local_conn, "document_hash")
    path_col = pick_first(cols, ["path", "document_path", "file_path", "filepath"])
    hash_col = pick_first(cols, ["md5", "hash", "document_hash", "checksum"])

    if not path_col or not hash_col:
        # Can't safely query; schema is unknown.
        return None

    # Try a few plausible normalizations
    candidates = []
    p_abs = expand_user(pdf_path)
    candidates.append(p_abs)
    candidates.append(os.path.realpath(p_abs))
    candidates.append(p_abs.replace("\\", "/"))

    for cand in candidates:
        row = local_conn.execute(
            f"SELECT {hash_col} FROM document_hash WHERE {path_col}=? LIMIT 1",
            (cand,),
        ).fetchone()
        if row and row[0]:
            return str(row[0])

    return None


def fetch_highlights(shared_conn: sqlite3.Connection, doc_md5: str) -> List[Highlight]:
    if not table_exists(shared_conn, "highlights"):
        raise RuntimeError("No 'highlights' table found in shared database.")

    cols = table_columns(shared_conn, "highlights")

    # Document key field is documented as `document_path` (md5 hash). :contentReference[oaicite:1]{index=1}
    doc_key_col = pick_first(cols, ["document_path", "document", "doc", "path"])
    text_col = pick_first(cols, ["desc", "text", "contents", "content"])
    type_col = pick_first(cols, ["type", "highlight_type", "kind"])

    bx = pick_first(cols, ["begin_x", "start_x", "bx"])
    by = pick_first(cols, ["begin_y", "start_y", "by"])
    ex = pick_first(cols, ["end_x", "stop_x", "ex"])
    ey = pick_first(cols, ["end_y", "stop_y", "ey"])

    if not doc_key_col or not text_col:
        raise RuntimeError("Couldn't identify required columns in 'highlights' table.")

    select_cols = [text_col]
    if type_col:
        select_cols.append(type_col)
    else:
        select_cols.append("NULL as type")

    for c in (bx, by, ex, ey):
        if c:
            select_cols.append(c)
        else:
            select_cols.append("NULL")

    order_by = by if by else text_col
    sql = f"""
        SELECT {", ".join(select_cols)}
        FROM highlights
        WHERE {doc_key_col}=?
        ORDER BY {order_by} ASC
    """

    out: List[Highlight] = []
    for row in shared_conn.execute(sql, (doc_md5,)):
        # row layout: text, type, bx, by, ex, ey
        text = (row[0] or "").strip()
        htype = row[1] if row[1] is not None else None
        out.append(
            Highlight(
                text=text,
                htype=str(htype) if htype is not None else None,
                begin_x=float(row[2]) if row[2] is not None else None,
                begin_y=float(row[3]) if row[3] is not None else None,
                end_x=float(row[4]) if row[4] is not None else None,
                end_y=float(row[5]) if row[5] is not None else None,
            )
        )
    return out


def try_add_page_numbers(pdf_path: str, highlights: List[Highlight]) -> List[Highlight]:
    """
    Convert Sioyek absolute-document Y coordinates to (page, y-on-page) by
    using page heights, per the docs’ description of “absolute document space”. :contentReference[oaicite:2]{index=2}

    Requires PyMuPDF (`pip install pymupdf`). If unavailable, returns unchanged.
    """
    try:
        import fitz  # type: ignore
    except Exception:
        return highlights

    doc = fitz.open(pdf_path)
    page_heights = [doc.load_page(i).rect.height for i in range(doc.page_count)]
    page_widths = [doc.load_page(i).rect.width for i in range(doc.page_count)]

    # cumulative end-y positions in "stacked pages" model
    cum_end = []
    total = 0.0
    for h in page_heights:
        total += float(h)
        cum_end.append(total)

    def page_for_abs_y(abs_y: float) -> int:
        # abs_y is measured from the top of the stacked document
        idx = bisect.bisect_right(cum_end, abs_y)
        # clamp
        if idx < 0:
            idx = 0
        if idx >= len(page_heights):
            idx = len(page_heights) - 1
        return idx

    new_list: List[Highlight] = []
    for h in highlights:
        if h.begin_y is None:
            new_list.append(h)
            continue
        p0 = page_for_abs_y(h.begin_y)
        # Human-friendly 1-indexed page
        new_list.append(Highlight(**{**h.__dict__, "page": p0 + 1}))
    doc.close()
    return new_list


def render_markdown(
    pdf_path: str, highlights: List[Highlight], group_by_page: bool
) -> str:
    lines: List[str] = []
    lines.append(f"# Highlights: {os.path.basename(pdf_path)}")
    lines.append("")
    lines.append(f"- Source: `{pdf_path}`")
    lines.append("")

    if not highlights:
        lines.append("_No highlights found._")
        return "\n".join(lines)

    if group_by_page and any(h.page is not None for h in highlights):
        current_page = None
        for h in highlights:
            if h.page != current_page:
                current_page = h.page
                lines.append(
                    f"## Page {current_page}"
                    if current_page is not None
                    else "## (Unknown page)"
                )
            tag = f" ({h.htype})" if h.htype else ""
            txt = h.text if h.text else "_(empty highlight text)_"
            lines.append(f"-{tag} {txt}")
        return "\n".join(lines)

    # flat list
    for h in highlights:
        prefix = f"[p.{h.page}] " if h.page is not None else ""
        tag = f"({h.htype}) " if h.htype else ""
        txt = h.text if h.text else "(empty highlight text)"
        lines.append(f"- {prefix}{tag}{txt}")
    return "\n".join(lines)


def render_text(highlights: List[Highlight], group_by_page: bool) -> str:
    if not highlights:
        return "No highlights found.\n"

    if group_by_page and any(h.page is not None for h in highlights):
        out: List[str] = []
        current_page = None
        for h in highlights:
            if h.page != current_page:
                current_page = h.page
                out.append(
                    f"\n=== Page {current_page if current_page is not None else '?'} ==="
                )
            tag = f"[{h.htype}] " if h.htype else ""
            out.append(f"- {tag}{h.text}".rstrip())
        return "\n".join(out).lstrip() + "\n"

    out = []
    for h in highlights:
        prefix = f"(p.{h.page}) " if h.page is not None else ""
        tag = f"[{h.htype}] " if h.htype else ""
        out.append(f"- {prefix}{tag}{h.text}".rstrip())
    return "\n".join(out) + "\n"


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Extract Sioyek highlights for a single PDF."
    )
    ap.add_argument(
        "pdf", help="Path to the PDF file (the one you highlighted in Sioyek)."
    )
    ap.add_argument(
        "-o", "--output", help="Write output to this file (default: stdout)."
    )
    ap.add_argument(
        "--local-db", help="Path to local.db (default: XDG_DATA_HOME/sioyek/local.db)."
    )
    ap.add_argument(
        "--shared-db",
        help="Path to shared.db (default: XDG_DATA_HOME/sioyek/shared.db).",
    )
    ap.add_argument(
        "--format",
        choices=["md", "text", "json"],
        default="md",
        help="Output format (default: md).",
    )
    ap.add_argument(
        "--group-by-page",
        action="store_true",
        help="Group highlights by page (requires PyMuPDF for reliable page numbers).",
    )
    ap.add_argument(
        "--no-pages",
        action="store_true",
        help="Don't attempt to compute page numbers, even if PyMuPDF is installed.",
    )
    ap.add_argument(
        "--sioyek-path",
        help="Path to the Sioyek executable (enables status bar updates).",
    )

    args = ap.parse_args()
    pdf_path = expand_user(clean_path(args.pdf))

    if not os.path.exists(pdf_path):
        print(f"error: PDF not found: {pdf_path}", file=sys.stderr)
        return 2

    # Initialize Sioyek interface for status updates
    sioyek = None
    if args.sioyek_path:
        try:
            sioyek = Sioyek(clean_path(args.sioyek_path))
            sioyek.set_status_string(
                f"Extracting highlights for {os.path.basename(pdf_path)}..."
            )
        except Exception as e:
            print(f"warning: failed to connect to sioyek: {e}", file=sys.stderr)

    local_db, shared_db = find_db_paths(
        clean_path(args.local_db) if args.local_db else None,
        clean_path(args.shared_db) if args.shared_db else None,
    )

    if not os.path.exists(local_db):
        print(f"warning: local DB not found at {local_db}", file=sys.stderr)
    if not os.path.exists(shared_db):
        print(f"warning: shared DB not found at {shared_db}", file=sys.stderr)

    # Connect (read-only)
    local_conn = open_sqlite_ro(local_db) if os.path.exists(local_db) else None
    shared_conn = open_sqlite_ro(shared_db) if os.path.exists(shared_db) else None
    if not shared_conn:
        print("error: could not open shared database.", file=sys.stderr)
        return 2

    # Resolve document md5
    doc_md5 = None
    if local_conn:
        doc_md5 = lookup_document_md5(local_conn, pdf_path)

    if not doc_md5:
        # Fallback: compute md5 of file contents
        # This is slower but works even if local.db doesn't have the path row.
        doc_md5 = md5_file(pdf_path)

    # Query highlights
    try:
        highlights = fetch_highlights(shared_conn, doc_md5)
    except Exception as e:
        print(f"error: failed to fetch highlights: {e}", file=sys.stderr)
        return 1
    finally:
        if local_conn:
            local_conn.close()
        shared_conn.close()

    # Optional page numbers
    if not args.no_pages:
        highlights = try_add_page_numbers(pdf_path, highlights)

    # Render
    if args.format == "json":
        payload: List[Dict[str, Any]] = []
        for h in highlights:
            payload.append(
                {
                    "text": h.text,
                    "type": h.htype,
                    "begin_x": h.begin_x,
                    "begin_y": h.begin_y,
                    "end_x": h.end_x,
                    "end_y": h.end_y,
                    "page": h.page,
                }
            )
        out_s = json.dumps(
            {"pdf": pdf_path, "count": len(highlights), "highlights": payload},
            indent=2,
            ensure_ascii=False,
        )
    elif args.format == "text":
        out_s = render_text(highlights, group_by_page=args.group_by_page)
    else:
        out_s = render_markdown(pdf_path, highlights, group_by_page=args.group_by_page)

    if args.output:
        out_path = expand_user(clean_path(args.output))
    else:
        out_path = pdf_path + "_highlights.md"

    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(out_s)

    if sioyek:
        sioyek.set_status_string(f"Highlights exported to {os.path.basename(out_path)}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
