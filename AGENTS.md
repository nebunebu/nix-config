# Repository Guidelines

## Project Structure & Module Organization
This is a Nix flake for NixOS and Home Manager configurations. Key paths:
- `flake.nix` and `flake.lock` define inputs and outputs.
- `hosts/<host>/` contains host-specific NixOS and HM entrypoints (examples: `hosts/antillia/nixos/default.nix`, `hosts/antillia/hm/default.nix`).
- `nixos-modules/` holds reusable NixOS modules; `hm-modules/` holds Home Manager modules.
- `users/<name>/` contains per-user HM and module wiring.
- `sops/` contains sops-nix configuration and encrypted secrets (`sops/secrets/`).
- `nix/` contains dev shell, formatter, and checks.

## Build, Test, and Development Commands
- `nix develop` enters the dev shell (provides `nixfmt-rfc-style`, `deadnix`, etc.).
- `nix flake check` runs flake checks, including formatting and pre-commit hooks.
- `nix fmt` runs the flake formatter (treefmt wrapper); keep formatting changes minimal.
- `nixos-rebuild switch --flake .#<host>` applies a host configuration (example: `.#antillia`).

## Coding Style & Naming Conventions
- Nix files are formatted with 2-space indentation; keep expressions small and composable.
- Use lowercase, hyphenated file names for modules (example: `nixos-modules/pipewire.nix`).
- Follow existing layout patterns for modules and host entrypoints.
- Prefer small, focused modules over monolithic host configs; add new modules under the relevant `*-modules/` directory.

## Testing Guidelines
- There are no unit test suites; rely on `nix flake check` for validation.
- When changing a host or module, rebuild the target host locally if possible.
- Name new module files after their feature area (example: `nixos-modules/self-hosted/navidrome.nix`).

## Commit & Pull Request Guidelines
- Commit messages are short and imperative (examples from history: `refactor users into ./users`, `fix antillia fs`).
- PRs should include a brief summary, the host(s)/module(s) touched, and the command(s) used to validate (e.g., `nix flake check`).
- Avoid committing decrypted secrets; `sops/secrets/` should remain encrypted.

## Security & Configuration Tips
- This repo expects `sops-nix` keys; without them, secrets and some builds will fail.
- Treat host configs as authoritative; update shared modules when multiple hosts need the same change.
