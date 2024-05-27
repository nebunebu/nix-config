# nix-config

This is my personal flake for my nix-configs.

It is a work in progress.

## Hosts

### t5610

My desktop

### x230t

My laptop.

### nixISO

Minimal config for iso-installer.

Swaps caps and escape keys.

## Programs

|                        |                  |
|-----------------------|------------------|
| **Shell:**             | zsh              |
| **Display Manager:**   | sddm             |
| **Multiplexer:**       | tmux             |
| **Terminal:**          | kitty            |
| **Launcher:**          | fuzzel           |
| **Browser:**           | firefox          |
| **Theme:**             | rose-pine        |
| **Video Player:**      | mpv              |
| **Pdf Viewer:**        | sioyek/xournalpp |
| **WM:**                | hyprland         |
| **Status Bar:**        | waybar           |
| **Secrets provision:** | sops-nix         |

## Directory Structure

```txt
.
├── flake.lock
├── flake.nix
├── hosts
│   ├── nixISO
│   ├── t5610
│   └── x230t
├── modules
│   ├── homeManager
│   └── nixOS
├── README.md
└── secrets
    └── secrets.yaml
```

## TODO

- [ ] start using some deployment tool like morph
- [ ] switch from waybar to ags
- [ ] add some images to README.md

## Special Thanks

All the helpful people on the **Nix/NixOs(unofficial)** discord server.
