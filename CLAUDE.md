# CLAUDE.md - AI Assistant Guide for nix-config

This document provides comprehensive guidance for AI assistants working with this NixOS configuration repository.

---

## Table of Contents

1. [Repository Overview](#repository-overview)
2. [Directory Structure](#directory-structure)
3. [Module System & Namespaces](#module-system--namespaces)
4. [Host Configuration](#host-configuration)
5. [Development Workflow](#development-workflow)
6. [Key Conventions & Patterns](#key-conventions--patterns)
7. [Common Tasks](#common-tasks)
8. [Special Considerations](#special-considerations)

---

## Repository Overview

This is a **flake-based NixOS configuration** repository managing multiple hosts with extensive modularization:

- **173+ Nix files** totaling ~2,626 lines of code
- **4 hosts**: t5610 (desktop), x230t (laptop), m715q (mini PC), iso (installation media)
- **68+ Home Manager modules** for user-space configuration
- **20+ NixOS modules** for system-level configuration
- **14 service modules** for self-hosted applications
- **Rose Pine theming** throughout via stylix
- **sops-nix** for secrets management
- **Impermanence** setup on desktop (ephemeral root)

### Core Technologies

- **Flakes**: Modern Nix with locked dependencies
- **Home Manager**: User environment management
- **Stylix**: System-wide theming
- **Hyprland**: Wayland compositor with extensive customization
- **SOPS**: Age-encrypted secrets
- **Pre-commit hooks**: Code quality automation

---

## Directory Structure

```
/home/user/nix-config/
├── flake.nix                 # Main flake definition (inputs & outputs)
├── flake.lock                # Locked dependency versions
├── .envrc                    # Direnv integration ("use flake")
├── .sops.yaml                # SOPS encryption configuration
│
├── hosts/                    # Host-specific configurations
│   ├── t5610/                # Desktop (main workstation)
│   ├── x230t/                # Laptop (ThinkPad X230 Tablet)
│   ├── m715q/                # Mini PC
│   └── iso/                  # Installation media
│
├── hm-modules/               # Home Manager modules (opts.* namespace)
│   ├── default.nix           # Master import with default opts
│   ├── ai/                   # AI tools (claude-code, aichat, etc.)
│   ├── communications/       # Discord, Thunderbird, etc.
│   ├── fs-tools/             # Bat, eza, fd, ripgrep, yazi, etc.
│   ├── nix-tools/            # Manix, nh, nix-index, etc.
│   ├── shells/               # Zsh, Starship
│   ├── taskwarrior/          # Task management
│   ├── terminal-emulators/   # Ghostty, Kitty, Foot
│   ├── web-browsers/         # Firefox, Chromium, FirefoxPWA
│   ├── window-managers/      # Hyprland, Mango
│   └── [standalone].nix      # Git, lazygit, tmux, fzf, etc.
│
├── nixos-modules/            # NixOS system modules (neb.* namespace)
│   ├── default.nix           # Master import
│   ├── boot.nix              # GRUB, Plymouth theming
│   ├── hyprland.nix          # System-level Hyprland
│   ├── nix.nix               # Nix daemon configuration
│   ├── stylix.nix            # System-wide theming
│   ├── users/                # User account definitions
│   └── virtualisation/       # Docker, virt-manager
│
├── serve/                    # Self-hosted service modules
│   ├── default.nix           # Master import
│   ├── jellyfin.nix          # Media server
│   ├── glance/               # Dashboard with pages
│   ├── ollama.nix            # LLM inference
│   └── [services].nix        # 14+ service configs
│
├── sops/                     # Secrets management
│   ├── default.nix           # Master import
│   ├── sops.nix              # Main SOPS config
│   └── secrets/              # Encrypted secrets.yaml
│
└── nix/                      # Development workflow
    ├── shell.nix             # Dev shell (convco, nixfmt, deadnix, statix)
    └── checks.nix            # Pre-commit hooks
```

### Key Files

| File | Purpose | Line Reference |
|------|---------|----------------|
| `flake.nix` | Main flake with inputs/outputs | Root |
| `hm-modules/default.nix` | All HM modules imported here | Root |
| `nixos-modules/default.nix` | All NixOS modules imported here | Root |
| `hosts/[host]/default.nix` | Returns `nixosConfiguration` | Per host |
| `hosts/[host]/nixos/default.nix` | System configuration | Per host |
| `hosts/[host]/hm/[user].nix` | User configuration | Per host/user |

---

## Module System & Namespaces

This repository uses a **two-namespace system** for clear separation:

### 1. `opts.*` Namespace (Home Manager)

Used for **user-space** configurations in `hm-modules/`

**Pattern:**
```nix
# File: hm-modules/git.nix
let
  cfg = config.opts.git;
in
{
  options.opts.git = {
    enable = lib.mkEnableOption "enable git";
    # Additional options...
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      # Configuration...
    };
  };
}
```

**Enable in host config:**
```nix
# File: hosts/t5610/hm/default.nix
opts = {
  git.enable = true;
  lazygit.enable = true;
  tmux.enable = true;
};
```

### 2. `neb.*` Namespace (NixOS)

Used for **system-level** configurations in `nixos-modules/`

**Pattern:**
```nix
# File: nixos-modules/stylix.nix
let
  cfg = config.neb.stylix;
in
{
  options.neb.stylix.enable = lib.mkEnableOption "enable stylix";

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      # Configuration...
    };
  };
}
```

**Enable in host config:**
```nix
# File: hosts/t5610/nixos/default.nix
neb = {
  stylix.enable = true;
  boot.enable = true;
  hyprland.enable = true;
};
```

### Categorical Modules

Modules grouped by function have parent enable options:

```nix
# File: hm-modules/fs-tools/default.nix
{
  imports = [ ./bat.nix ./eza.nix ./fd.nix /* ... */ ];

  options.opts.fs-tools.enable = lib.mkEnableOption "enable fs-tools";

  config = lib.mkIf cfg.enable {
    opts.fs-tools = {
      bat.enable = true;
      eza.enable = true;
      fd.enable = true;
      # Cascades to all children
    };
  };
}
```

**Location:** See `hm-modules/fs-tools/default.nix:1`

---

## Host Configuration

### Host Structure

Each host follows this consistent pattern:

```
hosts/<hostname>/
├── default.nix                    # Returns nixosConfiguration
├── nixos/
│   ├── default.nix                # System config (imports nixos-modules)
│   ├── hardware-configuration.nix # Generated hardware config
│   ├── facter.json                # Hardware facts from nixos-facter
│   └── [host-specific].nix        # Custom configs (impermanence, builder, etc.)
└── hm/
    ├── default.nix                # Home Manager config (imports hm-modules)
    └── [user].nix                 # Per-user configurations
```

### Host-Specific Files

**t5610 (Desktop):**
- `hosts/t5610/nixos/impermanence/` - Ephemeral root setup
- `hosts/t5610/nixos/builder.nix` - Remote builder configuration
- `hm-modules/window-managers/hyprland/t5610.nix` - Desktop Hyprland config

**x230t (Laptop):**
- `hosts/x230t/hm/nebu.nix` - Main user
- `hosts/x230t/hm/acgp.nix` - Secondary user
- `hosts/x230t/nixos/rotate.nix` - Tablet rotation script
- `hm-modules/window-managers/hyprland/x230t.nix` - Laptop Hyprland config

### Host Configuration Example

**Location:** `hosts/t5610/default.nix`

```nix
{
  t5610 = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs pkgs; };
    modules = [
      (inputs.self + "/hosts/t5610/nixos/default.nix")
      inputs.stylix.nixosModules.stylix
      inputs.sops-nix.nixosModules.sops
      inputs.nixos-facter-modules.nixosModules.facter
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          backupFileExtension = "backup";
          extraSpecialArgs = { inherit inputs; };
          users.nebu = import (inputs.self + "/hosts/t5610/hm/default.nix");
          sharedModules = [
            inputs.sops-nix.homeManagerModules.sops
            inputs.impermanence.homeManagerModules.impermanence
          ];
        };
      }
    ];
  };
}
```

---

## Development Workflow

### Entering the Dev Environment

```bash
cd /home/user/nix-config
# direnv automatically loads via .envrc
```

**Available tools** (see `nix/shell.nix:1`):
- `convco` - Conventional commits validation
- `nixfmt-rfc-style` - Nix code formatter
- `deadnix` - Dead code detection
- `statix` - Nix linter

### Building & Testing

```bash
# Build and activate system configuration
sudo nixos-rebuild switch --flake .#t5610

# Build without activation (test first)
sudo nixos-rebuild build --flake .#t5610

# Build and test in VM
sudo nixos-rebuild build-vm --flake .#t5610
./result/bin/run-t5610-vm

# Update flake inputs
nix flake update

# Update specific input
nix flake lock --update-input nixpkgs

# Check flake for errors
nix flake check
```

### Pre-commit Hooks

**Location:** `nix/checks.nix:1`

**Enabled hooks:**
- `deadnix` - With `noLambdaPatternNames = true`

**Disabled hooks** (can be enabled):
- `nixpkgs-fmt`
- `nil`
- `statix`

**Update hooks:**
```bash
nix develop  # Activates pre-commit hooks
```

### Branch Warning System

The dev shell warns when on the main branch via cowsay:

**Location:** `nix/shell.nix:12-30`

```bash
# Always work on feature branches
git checkout -b feature/new-module
```

---

## Key Conventions & Patterns

### 1. Module Definition Pattern

**Every module follows this structure:**

```nix
{ config, lib, pkgs, ... }:
let
  cfg = config.<namespace>.<module>;
in
{
  options.<namespace>.<module> = {
    enable = lib.mkEnableOption "enable <module>";
    # Additional options with mkOption...
  };

  config = lib.mkIf cfg.enable {
    # Configuration only applied when enabled
  };
}
```

### 2. Import-Based Composition

**Master import files aggregate modules:**

```nix
# File: hm-modules/default.nix
{
  imports = [
    ./git.nix
    ./lazygit.nix
    ./tmux.nix
    ./fs-tools      # Directory import (has default.nix)
    # ... all modules
  ];
}
```

### 3. Self-Reference Pattern

**Use `inputs.self` for internal imports:**

```nix
imports = [
  "${inputs.self}/nixos-modules"
  (inputs.self + "/hosts/t5610/nixos/default.nix")
];
```

### 4. Flake Input Pinning

**Always follow nixpkgs to avoid version conflicts:**

```nix
somePackage = {
  url = "github:user/repo";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

### 5. Rose Pine Theming

**Consistency across all applications:**

- System: `nixos-modules/stylix.nix:1`
- Hyprland: `hm-modules/window-managers/hyprland/theme.nix:1`
- Taskwarrior: `hm-modules/taskwarrior/theme.nix:1`

**Rose Pine colors:**
- Base: `#191724`
- Surface: `#1f1d2e`
- Overlay: `#26233a`
- Foam: `#9ccfd8`
- Rose: `#ebbcba`
- Pine: `#31748f`

### 6. Service Module Pattern

**Services live in `serve/` and use `neb.*` namespace:**

```nix
# File: serve/jellyfin.nix
{
  options.neb.jellyfin.enable = lib.mkEnableOption "enable jellyfin";

  config = lib.mkIf cfg.enable {
    services.jellyfin.enable = true;
    # Permissions, directories, etc.
  };
}
```

---

## Common Tasks

### Adding a New Home Manager Module

1. **Create the module file:**

```bash
# File: hm-modules/newtool.nix
{ config, lib, pkgs, ... }:
let
  cfg = config.opts.newtool;
in
{
  options.opts.newtool = {
    enable = lib.mkEnableOption "enable newtool";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.newtool ];

    # Optional: configure via home-manager
    programs.newtool = {
      enable = true;
      settings = {
        # ...
      };
    };
  };
}
```

2. **Add to master import:**

```nix
# File: hm-modules/default.nix (add to imports list)
imports = [
  # ...
  ./newtool.nix
];
```

3. **Enable in host config:**

```nix
# File: hosts/t5610/hm/default.nix
opts = {
  newtool.enable = true;
};
```

### Adding a New NixOS Module

1. **Create the module file:**

```bash
# File: nixos-modules/newservice.nix
{ config, lib, pkgs, ... }:
let
  cfg = config.neb.newservice;
in
{
  options.neb.newservice = {
    enable = lib.mkEnableOption "enable newservice";
  };

  config = lib.mkIf cfg.enable {
    services.newservice = {
      enable = true;
      # Configuration...
    };
  };
}
```

2. **Add to master import:**

```nix
# File: nixos-modules/default.nix
imports = [
  # ...
  ./newservice.nix
];
```

3. **Enable in host config:**

```nix
# File: hosts/t5610/nixos/default.nix
neb = {
  newservice.enable = true;
};
```

### Adding a New Host

1. **Create host directory structure:**

```bash
mkdir -p hosts/newhost/{nixos,hm}
```

2. **Create `hosts/newhost/default.nix`:**

```nix
{ inputs, system, pkgs, ... }:
{
  newhost = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs pkgs; };
    modules = [
      (inputs.self + "/hosts/newhost/nixos/default.nix")
      inputs.stylix.nixosModules.stylix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          users.yourusername = import (inputs.self + "/hosts/newhost/hm/default.nix");
        };
      }
    ];
  };
}
```

3. **Create NixOS config:**

```nix
# File: hosts/newhost/nixos/default.nix
{ inputs, config, pkgs, ... }:
{
  imports = [
    "${inputs.self}/nixos-modules"
    ./hardware-configuration.nix
  ];

  networking.hostName = "newhost";

  neb = {
    stylix.enable = true;
    # Enable modules as needed
  };
}
```

4. **Create HM config:**

```nix
# File: hosts/newhost/hm/default.nix
{ inputs, config, pkgs, ... }:
{
  imports = [ "${inputs.self}/hm-modules" ];

  opts = {
    git.enable = true;
    # Enable modules as needed
  };
}
```

5. **Add to flake outputs:**

```nix
# File: flake.nix (in outputs section)
nixosConfigurations = (
  (import ./hosts/newhost { inherit inputs system pkgs; })
  // # ... existing hosts
);
```

### Adding Secrets with SOPS

1. **Encrypt a new secret:**

```bash
# Edit encrypted secrets file
sops sops/secrets/secrets.yaml

# Add your secret:
# new_secret: "value"
```

2. **Create SOPS module:**

```nix
# File: sops/newsecret.nix
{ config, lib, ... }:
let
  cfg = config.neb.newsecret;
in
{
  options.neb.newsecret.enable = lib.mkEnableOption "enable newsecret";

  config = lib.mkIf cfg.enable {
    sops.secrets.new_secret = {
      sopsFile = ./secrets/secrets.yaml;
      owner = "yourusername";
      mode = "0400";
    };
  };
}
```

3. **Add to master import:**

```nix
# File: sops/default.nix
imports = [
  ./newsecret.nix
];
```

4. **Enable and use:**

```nix
# In host config
neb.newsecret.enable = true;

# Reference secret path
config.sops.secrets.new_secret.path  # -> /run/secrets/new_secret
```

### Adding a Self-Hosted Service

1. **Create service module:**

```nix
# File: serve/newapp.nix
{ config, lib, pkgs, ... }:
let
  cfg = config.neb.newapp;
in
{
  options.neb.newapp.enable = lib.mkEnableOption "enable newapp";

  config = lib.mkIf cfg.enable {
    services.newapp = {
      enable = true;
      port = 8080;
      # Configuration...
    };

    # Optional: Open firewall
    networking.firewall.allowedTCPPorts = [ 8080 ];

    # Optional: Create data directory
    systemd.tmpfiles.rules = [
      "d /srv/newapp 0750 newapp newapp -"
    ];
  };
}
```

2. **Add to master import:**

```nix
# File: serve/default.nix
imports = [
  ./newapp.nix
];
```

3. **Enable in host:**

```nix
# File: hosts/t5610/nixos/default.nix
neb = {
  newapp.enable = true;
};
```

### Updating Flake Inputs

```bash
# Update all inputs
nix flake update

# Update specific input
nix flake lock --update-input nebvim

# Check what changed
git diff flake.lock
```

### Formatting & Linting

```bash
# Format all Nix files
find . -name "*.nix" -exec nixfmt-rfc-style {} \;

# Find dead code
deadnix .

# Lint code
statix check .

# Fix auto-fixable issues
statix fix .
```

---

## Special Considerations

### 1. Impermanence Setup (t5610)

The desktop uses **ephemeral root** on btrfs:

**Location:** `hosts/t5610/nixos/impermanence/`

- Root filesystem wiped on boot
- Persistent data under `/persist/system/`
- Old roots kept for 30 days in `.snapshots`
- Home Manager integration for user data

**When adding system state:**
```nix
# Add to persistence list
environment.persistence."/persist/system" = {
  directories = [
    "/var/lib/newservice"  # Add service data
  ];
  files = [
    "/etc/newconfig"       # Add config files
  ];
};
```

**Location reference:** `hosts/t5610/nixos/impermanence/default.nix:1`

### 2. Multiple Users (x230t)

The laptop supports two users: **nebu** and **acgp**

**Configuration:**
```nix
# File: hosts/x230t/default.nix
home-manager.users = {
  nebu = import ./hm/nebu.nix;
  acgp = import ./hm/acgp.nix;
};
```

**When adding features for specific users:**
- Create separate HM configs per user
- Enable different module sets per user

### 3. Host-Specific Hyprland Configs

Hyprland has per-host overrides:

- `hm-modules/window-managers/hyprland/t5610.nix` - Desktop settings
- `hm-modules/window-managers/hyprland/x230t.nix` - Laptop settings (includes rotation)

**Pattern:**
```nix
# File: hm-modules/window-managers/hyprland/default.nix
config = lib.mkIf cfg.enable {
  # Common config
  imports = [
    ./${config.networking.hostName}.nix  # Import host-specific
  ];
};
```

### 4. Remote Builder Configuration

**t5610 acts as remote builder for other machines:**

**Location:** `hosts/t5610/nixos/builder.nix:1`

- Dedicated `builder` user
- SSH key authentication
- Trusted for nix operations

**Using from another machine:**
```nix
nix.buildMachines = [{
  hostName = "t5610";
  system = "x86_64-linux";
  maxJobs = 8;
  speedFactor = 2;
  supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
}];
```

### 5. Custom Inline Packages

Some packages are defined inline:

**Example:** `hm-modules/default.nix:1`

```nix
home.packages = [
  (pkgs.writeShellApplication {
    name = "roseify";
    runtimeInputs = [ pkgs.lutgen ];
    text = ''
      lutgen apply "$1" -o "roseified-$1" -p rose-pine
    '';
  })
];
```

**When creating inline tools:**
- Use `pkgs.writeShellApplication` for scripts
- Add `runtimeInputs` for dependencies
- Keep it in the relevant module

### 6. Secrets Management Details

**SOPS configuration:** `.sops.yaml:1`

- Uses **age** encryption (not GPG)
- Key stored at: `/home/nebu/.config/sops/age/keys.txt`
- Secrets file: `sops/secrets/secrets.yaml`

**Secret paths at runtime:**
```nix
config.sops.secrets.name.path  # -> /run/secrets/name
```

**Editing secrets:**
```bash
sops sops/secrets/secrets.yaml
```

### 7. Installation ISO

**Build ISO:**
```bash
nix run nixpkgs#nixos-generators -- \
  --format iso --flake ~/.nix-config#iso -o iso
```

**Test in VM:**
```bash
nix run .#nixosConfigurations.iso.config.system.build.vm -- \
  -device virtio-vga
```

**Location:** `hosts/iso/nixos/default.nix:1`

### 8. Theming with Stylix

**System-wide theming:** `nixos-modules/stylix.nix:1`

- Base16 scheme: Rose Pine
- Wallpaper: Auto-fetched from theme
- Cursor: Rose Pine
- Fonts: IBM Plex family

**Overriding theme for specific apps:**
```nix
opts.mytool = {
  enable = true;
  theme = "rose-pine";  # Match stylix
};
```

### 9. Git Workflow

**Commit message format:**
- Use conventional commits (enforced by `convco`)
- Format: `type(scope): description`
- Types: feat, fix, docs, style, refactor, test, chore

**Example:**
```bash
git commit -m "feat(hm-modules): add newtool module"
git commit -m "fix(hyprland): correct x230t rotation script"
```

### 10. Documentation Maintenance

**README.md warning:** `README.md:3-9`

> The README notes it may not accurately reflect the codebase

**When making significant changes:**
- Update this CLAUDE.md file
- Consider updating README.md if structure changes
- Document breaking changes in commit messages

---

## Quick Reference

### File Locations Cheat Sheet

| What | Where | Line |
|------|-------|------|
| Main flake | `flake.nix` | 1 |
| Host configs | `hosts/[host]/default.nix` | Per host |
| System config | `hosts/[host]/nixos/default.nix` | Per host |
| User config | `hosts/[host]/hm/[user].nix` | Per host |
| All HM modules | `hm-modules/default.nix` | 1 |
| All NixOS modules | `nixos-modules/default.nix` | 1 |
| All services | `serve/default.nix` | 1 |
| All secrets | `sops/default.nix` | 1 |
| Dev shell | `nix/shell.nix` | 1 |
| Pre-commit | `nix/checks.nix` | 1 |
| Hyprland main | `hm-modules/window-managers/hyprland/default.nix` | 1 |
| Hyprland t5610 | `hm-modules/window-managers/hyprland/t5610.nix` | 1 |
| Hyprland x230t | `hm-modules/window-managers/hyprland/x230t.nix` | 1 |
| Stylix config | `nixos-modules/stylix.nix` | 1 |
| User definitions | `nixos-modules/users/` | Directory |
| Impermanence | `hosts/t5610/nixos/impermanence/default.nix` | 1 |

### Common Commands

```bash
# Development
nix develop                                    # Enter dev shell (or cd with direnv)
nix flake update                               # Update all inputs
nix flake check                                # Check flake for errors

# Building
sudo nixos-rebuild switch --flake .#t5610      # Build and activate
sudo nixos-rebuild build --flake .#t5610       # Build only (test)
sudo nixos-rebuild build-vm --flake .#t5610    # Build VM for testing

# Formatting & Linting
nixfmt-rfc-style **/*.nix                      # Format all Nix files
deadnix .                                      # Find dead code
statix check .                                 # Lint code
statix fix .                                   # Auto-fix issues

# Secrets
sops sops/secrets/secrets.yaml                 # Edit secrets

# Git
convco check                                   # Check commit messages
git commit -m "feat(scope): description"       # Conventional commit
```

### Module Enable Syntax

```nix
# Home Manager (in hosts/[host]/hm/[user].nix)
opts = {
  git.enable = true;
  tmux.enable = true;
  fs-tools.enable = true;  # Enables category
};

# NixOS (in hosts/[host]/nixos/default.nix)
neb = {
  stylix.enable = true;
  hyprland.enable = true;
  boot.enable = true;
};

# Services (in hosts/[host]/nixos/default.nix)
neb = {
  jellyfin.enable = true;
  glance.enable = true;
  ollama.enable = true;
};
```

---

## Working with AI Assistants

### Best Practices for AI

When an AI assistant works on this codebase:

1. **Always check the namespace** - `opts.*` for HM, `neb.*` for NixOS
2. **Follow the module pattern** - Use the standard structure shown above
3. **Add to master imports** - Don't forget `hm-modules/default.nix` or `nixos-modules/default.nix`
4. **Maintain Rose Pine theme** - Keep theming consistent
5. **Test before committing** - Use `nixos-rebuild build` first
6. **Use conventional commits** - Format: `type(scope): description`
7. **Check for host-specific needs** - Some configs differ per host
8. **Respect impermanence** - Add persistence when needed on t5610
9. **Format code** - Run `nixfmt-rfc-style` before committing
10. **Update this file** - Keep CLAUDE.md current with major changes

### Common AI Tasks

**"Add support for [tool]":**
1. Create module in `hm-modules/[tool].nix` or `nixos-modules/[tool].nix`
2. Use appropriate namespace (`opts.*` or `neb.*`)
3. Add to master import
4. Document in this file if significant

**"Configure Hyprland to [do something]":**
1. Check if host-specific: `hm-modules/window-managers/hyprland/{t5610,x230t}.nix`
2. Or common: `hm-modules/window-managers/hyprland/default.nix`
3. Maintain Rose Pine colors
4. Test on correct host

**"Add service for [app]":**
1. Create in `serve/[app].nix`
2. Use `neb.*` namespace
3. Set up users, directories, firewall
4. Add to `serve/default.nix`

**"Fix [something] on [host]":**
1. Navigate to `hosts/[host]/`
2. Identify if NixOS or HM issue
3. Modify appropriate config
4. Test with `nixos-rebuild build --flake .#[host]`

---

## Conclusion

This NixOS configuration is a mature, well-architected system with:

- **Consistent patterns** throughout (two namespaces, module structure)
- **Excellent modularity** (173+ files, clear organization)
- **Production features** (secrets management, impermanence, theming)
- **Multi-host support** with host-specific customization
- **Developer-friendly** workflow (direnv, pre-commit, formatters)

When working with this codebase:
- Follow the established patterns
- Maintain the namespace conventions
- Keep theming consistent (Rose Pine)
- Test thoroughly before deploying
- Document significant changes

---

**Last Updated:** 2025-11-18
**Repository:** nebunebu/nix-config
**Maintainer:** nebu
**License:** Personal configuration (see repository for details)
