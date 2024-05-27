# nix-config

This is my personal flake for my nix-configs.

It is a work in progress.

## Hosts

### t5610

My desktop

<!-- <details> -->
<!---->
<!-- <summary>sddm preview</summary> -->
<!---->
<!-- #### SDDM Preview -->
<!---->
<!-- </details> -->

### x230t

My laptop.

### nixISO

Minimal config for iso-installer.

Swaps caps and escape keys.

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

## Programs

| Category               | Programs         | Config           |
|------------------------|------------------|------------------|
| **Shell:**             | zsh              |                  |
| **Display Manager:**   | [sddm-sugar-candy-nix](https://gitlab.com/Zhaith-Izaliel/sddm-sugar-candy-nix) | [sddm.nix](./modules/nixOS/sddm.nix) |
| **Multiplexer:**       | tmux             |                  |
| **Terminal:**          | kitty            |                  |
| **Launcher:**          | fuzzel           |                  |
| **Browser:**           | firefox          |                  |
| **Theme:**             | rose-pine        |                  |
| **Video Player:**      | mpv              |                  |
| **Pdf Viewer:**        | sioyek           |                  |
|                        | xournalpp        |                  |
| **WM:**                | hyprland         |                  |
| **Status Bar:**        | waybar           |                  |
<!-- | **Secrets provision:** | [sops-nix](https://github.com/Mic92/sops-nix)         |                  | -->

<!-- |                        |                  | -->
<!-- |-----------------------|------------------| -->
<!-- | **Shell:**             | zsh              | -->
<!-- | **Display Manager:**   | sddm             | -->
<!-- | **Multiplexer:**       | tmux             | -->
<!-- | **Terminal:**          | kitty            | -->
<!-- | **Launcher:**          | fuzzel           | -->
<!-- | **Browser:**           | firefox          | -->
<!-- | **Theme:**             | rose-pine        | -->
<!-- | **Video Player:**      | mpv              | -->
<!-- | **Pdf Viewer:**        | sioyek/xournalpp | -->
<!-- | **WM:**                | hyprland         | -->
<!-- | **Status Bar:**        | waybar           | -->
<!-- | **Secrets provision:** | sops-nix         | -->

## TODO

- [ ] start using some deployment tool like morph
- [ ] switch from waybar to ags
- [ ] add some images to README.md

## Special Thanks

All the helpful people on the **Nix/NixOs(unofficial)** discord server.
