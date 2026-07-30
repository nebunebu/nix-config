#!/usr/bin/env bash
# Installs the "fonseca" host from a live NixOS ISO.
#
# Usage: sudo ./install.sh [--refacter]
#
# Run this from a live NixOS environment after cloning this repo, e.g.:
#   git clone https://github.com/<you>/.nix-config.git
#   cd .nix-config
#   sudo ./install.sh
#
# This WIPES the disk named by DISK_ID below. Everything on it is destroyed.
#
# The target disk is hardcoded (DISK_ID) and committed into
# hosts/fonseca/nixos/disko.nix. This script verifies the two agree; it never
# rewrites the config. A previous version patched disko.nix at runtime, which
# did not survive a re-clone and could wipe the wrong disk on a second run.
#
# Every long step is logged under /tmp/fonseca-install/, and the install is
# only reported successful if the resulting system actually looks bootable.

set -euo pipefail

HOST="fonseca"
DISK_ID="/dev/disk/by-id/nvme-INTEL_SSDPEKKF256G8L_BTHH82340X2N256B"

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DISKO_FILE="$REPO_DIR/hosts/$HOST/nixos/disko.nix"
FACTER_FILE="$REPO_DIR/hosts/$HOST/nixos/facter.json"
LOG_DIR="/tmp/$HOST-install"
SWAPFILE="/mnt/swapfile"

REFACTER=0
for arg in "$@"; do
  case "$arg" in
    --refacter) REFACTER=1 ;;
    -h | --help)
      sed -n '2,20p' "${BASH_SOURCE[0]}"
      exit 0
      ;;
    *)
      echo "error: unknown argument: $arg" >&2
      exit 1
      ;;
  esac
done

die() {
  echo >&2
  echo "error: $*" >&2
  exit 1
}

step() {
  echo
  echo "==> $*"
}

# Run a command, teeing its output to $LOG_DIR/<name>.log. pipefail makes the
# command's exit status survive the pipe.
run_logged() {
  local name="$1"
  shift
  mkdir -p "$LOG_DIR"
  "$@" 2>&1 | tee "$LOG_DIR/$name.log"
}

cleanup_swap() {
  if swapon --show=NAME --noheadings 2>/dev/null | grep -qx "$SWAPFILE"; then
    swapoff "$SWAPFILE" || true
  fi
  rm -f "$SWAPFILE"
}

on_err() {
  local rc=$?
  echo >&2
  echo "################################################################" >&2
  echo "install failed (exit $rc)" >&2
  echo "logs: $LOG_DIR" >&2
  find "$LOG_DIR" -maxdepth 1 -type f -printf '  - %f\n' 2>/dev/null >&2 || true
  echo "################################################################" >&2
  cleanup_swap
}
trap on_err ERR

# --------------------------------------------------------------------------
# Preflight — nothing below this section touches the disk.
# --------------------------------------------------------------------------

[[ $EUID -eq 0 ]] || die "must be run as root (use sudo)"

[[ -e /etc/NIXOS ]] ||
  die "this doesn't look like a NixOS live environment (/etc/NIXOS missing)"

# disko.nix lays down a GPT with an EF00 ESP and no bios_grub partition, so a
# BIOS/CSM-booted ISO physically cannot produce a bootable disk. Refuse rather
# than wipe one.
[[ -d /sys/firmware/efi ]] || die "the ISO is booted in BIOS/CSM mode, not UEFI.
Reboot the installer in UEFI mode (disable CSM / pick the UEFI entry for the USB
stick). Installing now would wipe the disk and produce an unbootable system."

step "Checking repo state"

[[ -f "$DISKO_FILE" ]] || die "missing $DISKO_FILE"

if ! grep -qF "\"$DISK_ID\"" "$DISKO_FILE"; then
  echo "disko.nix declares:" >&2
  grep -n '^\s*device\s*=' "$DISKO_FILE" >&2 || true
  die "$DISKO_FILE does not name the expected disk.
Expected: $DISK_ID
Fix disko.nix (or DISK_ID in this script) so the two agree."
fi
echo "disko.nix device matches DISK_ID"

# nix evaluates the git tree and ignores UNTRACKED files, so an untracked
# facter.json would silently not exist as far as the build is concerned.
[[ -f "$FACTER_FILE" ]] || die "missing $FACTER_FILE"
if git -C "$REPO_DIR" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$REPO_DIR" ls-files --error-unmatch "$FACTER_FILE" >/dev/null 2>&1 ||
    die "$FACTER_FILE is not tracked by git.
nix ignores untracked files, so the build would not see it. Run:
  git add ${FACTER_FILE#"$REPO_DIR"/}"
  echo "facter.json is tracked by git"
fi

# Guard against the report being another host's copy.
for other in "$REPO_DIR"/hosts/*/nixos/facter.json; do
  [[ "$other" == "$FACTER_FILE" ]] && continue
  if cmp -s "$FACTER_FILE" "$other"; then
    die "$FACTER_FILE is byte-identical to $other.
That is another host's hardware report, not fonseca's. Regenerate it with:
  sudo ./install.sh --refacter"
  fi
done
echo "facter.json is specific to $HOST"

step "Checking target disk"

[[ -e "$DISK_ID" ]] || die "$DISK_ID does not exist.
Available disks:
$(lsblk -d -o NAME,SIZE,MODEL)

by-id links:
$(ls /dev/disk/by-id/)"

DISK="$(readlink -f "$DISK_ID")"
[[ -b "$DISK" ]] || die "$DISK_ID does not resolve to a block device (got $DISK)"

echo "About to WIPE and partition:"
echo "  $DISK_ID"
echo "  -> $DISK"
echo
lsblk "$DISK"
echo
read -r -p "Type 'yes' to continue: " confirm
[[ "$confirm" == "yes" ]] || {
  echo "Aborted."
  exit 1
}

mkdir -p "$LOG_DIR"

step "EFI boot entries before install (for the record)"
efibootmgr -v 2>&1 | tee "$LOG_DIR/efibootmgr-before.log" || true

if [[ $REFACTER -eq 1 ]]; then
  step "Re-probing hardware with nixos-facter (overwrites $FACTER_FILE)"
  run_logged facter \
    nix run --extra-experimental-features "nix-command flakes" \
    github:nix-community/nixos-facter -- -o "$FACTER_FILE"
  # facter runs as root; leave the file readable and owned by the repo owner so
  # later non-root `nix` evaluation and `git` still work.
  chmod 0644 "$FACTER_FILE"
  chown --reference="$DISKO_FILE" "$FACTER_FILE" || true
fi

# --------------------------------------------------------------------------
# Evaluate before wiping: a config error must not leave a destroyed disk.
#
# Eval only, deliberately. `nix build` here would realise the whole ~14G closure
# into the ISO's RAM-backed store before the target disk even exists.
# nixos-install builds into the target store, which is where it belongs. The
# tradeoff: a genuine *build* failure can only surface later, during install.
# --------------------------------------------------------------------------

step "Evaluating $HOST configuration (before touching the disk)"
run_logged eval \
  nix eval --extra-experimental-features "nix-command flakes" \
  --raw "$REPO_DIR#nixosConfigurations.$HOST.config.system.build.toplevel.drvPath"
echo

step "Partitioning and formatting with disko"
run_logged disko \
  nix run --extra-experimental-features "nix-command flakes" \
  github:nix-community/disko/latest -- \
  --mode disko \
  --flake "$REPO_DIR#$HOST"

step "Mounted filesystems"
findmnt -R /mnt | tee "$LOG_DIR/findmnt.log"

mountpoint -q /mnt || die "/mnt is not mounted — disko did not mount the root filesystem"
mountpoint -q /mnt/boot || die "/mnt/boot is not mounted — the ESP is missing"

# 8G of RAM is tight for evaluating and building this closure. Cheap insurance;
# removed again before we finish.
step "Enabling temporary swap on the target"
if [[ -n "$(swapon --show=NAME --noheadings 2>/dev/null)" ]]; then
  echo "swap already active, skipping"
else
  # btrfs needs mkswapfile: a plain dd + mkswap file is CoW and gets rejected.
  btrfs filesystem mkswapfile --size 8G "$SWAPFILE"
  swapon "$SWAPFILE"
  swapon --show
fi

step "Installing NixOS (this takes a while)"
run_logged nixos-install \
  nixos-install --flake "$REPO_DIR#$HOST" --no-root-passwd

# --------------------------------------------------------------------------
# Verify. The previous version of this script trusted exit codes, printed
# "Install complete", and left an empty ESP and no system profile behind.
# --------------------------------------------------------------------------

step "Verifying the installed system"

echo "--- /mnt/boot/EFI ---"
find /mnt/boot/EFI -maxdepth 3 2>&1 | tee "$LOG_DIR/esp-contents.log" || true
echo "---------------------"

ok=1
check() {
  local label="$1"
  shift
  if "$@"; then
    echo "  ok   $label"
  else
    echo "  FAIL $label"
    ok=0
  fi
}

exists() { [[ -e "$1" ]]; }

# With efiInstallAsRemovable the binary lands at EFI/BOOT/BOOTX64.EFI; without
# it, at EFI/NixOS/grubx64.efi. Either is a successfully installed bootloader.
have_boot_efi() {
  [[ -n "$(find /mnt/boot/EFI \( -iname 'grub*.efi' -o -iname 'bootx64.efi' \) -print -quit 2>/dev/null)" ]]
}

check "system profile exists" exists /mnt/nix/var/nix/profiles/system
check "/etc/NIXOS exists" exists /mnt/etc/NIXOS
check "bootloader EFI binary present on the ESP" have_boot_efi
check "grub.cfg present on the ESP" exists /mnt/boot/grub/grub.cfg

if [[ $ok -ne 1 ]]; then
  die "the install did not produce a bootable system (see failures above).
Logs: $LOG_DIR
Do NOT reboot expecting this to work — investigate $LOG_DIR/nixos-install.log first."
fi

step "Copying this repo to /mnt/root/.nix-config"
rm -rf /mnt/root/.nix-config
mkdir -p /mnt/root
cp -a "$REPO_DIR" /mnt/root/.nix-config
# cp -a preserves the ISO user's uid (1000), which is a different user on the
# installed system.
chown -R root:root /mnt/root/.nix-config

step "EFI boot entries after install"
efibootmgr -v 2>&1 | tee "$LOG_DIR/efibootmgr-after.log" || true
if ! grep -qi nixos "$LOG_DIR/efibootmgr-after.log"; then
  echo
  echo "note: firmware has no NixOS NVRAM entry. This host is configured with"
  echo "      boot.loader.grub.efiInstallAsRemovable, so it boots via the"
  echo "      fallback path \\EFI\\BOOT\\BOOTX64.EFI instead — pick the generic"
  echo "      NVMe entry in the boot menu."
fi

cleanup_swap
trap - ERR

cat <<EOF

==> Install complete. Verified: system profile, /etc/NIXOS, grubx64.efi and
    grub.cfg are all present. Logs are in $LOG_DIR.

==> Next steps:
    1. Reboot into $HOST and log in.
       If the firmware still lists a stale "Windows Boot Manager" entry pointing
       at the old install, remove it:
         efibootmgr -v            # find its Boot#### number
         efibootmgr -b <NNNN> -B
    2. This repo was copied to /root/.nix-config on the new system.
    3. Make sops secrets decryptable on $HOST:
       a. Get the host age key:
            nix run --extra-experimental-features "nix-command flakes" nixpkgs#ssh-to-age -- -i /etc/ssh/ssh_host_ed25519_key.pub
       b. Add it to .sops.yaml (repo root) as a new "&$HOST" anchor, both under
          'keys:' and in 'creation_rules[0].key_groups[0].age'.
       c. From a machine that can already decrypt secrets, run:
            sops updatekeys sops/secrets/secrets.yaml
       d. Commit and push, then on $HOST:
            nixos-rebuild switch --flake .#$HOST
EOF
