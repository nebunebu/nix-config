# NixOS Configuration Flake

## Project Overview
This repository contains a Nix flake for managing NixOS and Home Manager configurations across multiple hosts. It utilizes `flake.nix` for dependency management and `sops-nix` for secrets provisioning.

**Key Technologies:**
- **NixOS**: System configuration.
- **Home Manager**: User environment management (integrated into NixOS modules).
- **Flakes**: Reproducible dependency and output management.
- **sops-nix**: Secret management using SOPS and age.
- **Stylix**: System-wide theming.

## Building and Running

### Applying Configuration
To apply the configuration for a specific host:
```bash
nixos-rebuild switch --flake .#<hostname>
```
Available hosts: `antillia`, `bermeja`, `royllo`, `tuanaki`.

### Development Environment
Enter the development shell to get access to tools like `nixfmt`, `deadnix`, and `statix`:
```bash
nix develop
```

### Verification and Formatting
Run flake checks (including pre-commit hooks):
```bash
nix flake check
```

Format the codebase (wraps `treefmt`):
```bash
nix fmt
```

## Development Conventions

### Directory Structure
- `flake.nix`: Entry point, defines inputs and outputs.
- `hosts/<host>/`: Host-specific configurations.
    - `nixos/`: NixOS configuration for the host.
    - `hm/`: Home Manager configuration for the host.
- `nixos-modules/`: Reusable NixOS modules.
- `hm-modules/`: Reusable Home Manager modules.
- `users/<user>/`: User-specific configuration (often imported by hosts).
- `sops/`: Secrets configuration and encrypted files.

### Coding Style
- **Formatting**: 2-space indentation. Always run `nix fmt` before committing.
- **Modules**: Prefer small, focused modules. Place shared logic in `nixos-modules/` or `hm-modules/`.
- **Commits**: Use short, imperative commit messages (e.g., "fix: update hyprland config").

### Secrets
- Secrets are managed with `sops-nix`.
- Encrypted files are located in `sops/secrets/`.
- **WARNING**: Do not commit decrypted secrets. Ensure you have the necessary age keys to decrypt/edit secrets.
