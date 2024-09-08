# nix-config

> [!Warning]
> These configs are always evolving so the READEME.md
> may not accurately reflect the codebase.
>
> Don't expect to be able to clone this repo and use.
> Not having the key for sops-nix will prevent you from
> doing so.

This is my personal flake for my nix-configs.

## Features

- Flake-based Configuration
- Multiple Host Configurations
  - t5610 (desktop)
  - x230t (laptop with tablet functionality)
  - g500s (server)
  - nixISO (bootable iso image)
- Home Manager Integration
- Custom Package Definitions
- Secrets Management with `sops-nix`
- Dev Environment with pre-commit hooks
- System-wide theming with stylix
- Configured Hyprland setup with plugins

## Programs

| Category               | Programs                                                                       |
| ---------------------- | ------------------------------------------------------------------------------ |
| **Theme:**             | [rose-pine](https://rosepinetheme.com)                                         |
| **Theming:**           | [stylix](https://rosepinetheme.com)                                            |
|                        |                                                                                |
| **Display Manager:**   | [sddm-sugar-candy-nix](https://gitlab.com/Zhaith-Izaliel/sddm-sugar-candy-nix) |
|                        |                                                                                |
| **Shell:**             | [zsh](https://www.zsh.org)                                                     |
| **Terminal:**          | [kitty](https://github.com/kovidgoyal/kitty)                                   |
| **Multiplexer:**       | [tmux](https://github.com/tmux/tmux)                                           |
|                        |                                                                                |
| **Browser:**           | [firefox](https://firefox-source-docs.mozilla.org/contributing/index.html)     |
| **Video Player:**      | [mpv](https://mpv.io/)                                                         |
| **Pdf Viewer:**        | [sioyek](https://sioyek.info)                                                  |
|                        | [xournalpp](https://github.com/xournalpp/xournalpp)                            |
| **WM:**                | [hyprland](https://github.com/hyprwm/Hyprland)                                 |
| **Status Bar:**        | [waybar](https://github.com/Alexays/Waybar)                                    |
| **Launcher:**          | [fuzzel](https://codeberg.org/dnkl/fuzzel)                                     |
| **Secrets provision:** | [sops-nix](https://github.com/Mic92/sops-nix)                                  |

## Structure

```sh
.
├── extModules
├── flake.lock
├── flake.nix
├── hosts
├── lib
├── modules
├── nix
├── overlays
├── pkgs
├── README.md
└── secrets
```

Each host is defined in `./flake.nix` with the function `./lib/mkHost.nix`. Each
host follows the same pattern of having its specific configurations under
`./hosts/[hostname]`.

The directory `./modules` contains the bulk of the configurations. It contains
subdirectories for homeManager and nixOS modules. I then import them into `hosts/[host]/homeManager`
and `hosts/[host]/nixOS` to make most of them. There are still some places where
this is not set up, let it be noted.

Custom definitions for modules and packages are
under `./extModules` and `./pkgs` respectively.

Overlays is for overlays, but it is not really used at this point. It is
basically there for future's sake.

The devShell and checks configuration are under `./nix` as `./nix/shell.nix` and
`./nix/checks.nix`.

Secrets are under `./secrets`

## TODO

- [ ] add installation instructions
- [ ] add image previews
- [ ] migrate to ags
- [ ] set up pkg overlays

## Contributing

Even though this is a personal configuration, submitting issues suggesting improvements
are welcomed. (I'm flying by the seat of my pants.)

## Special Thanks

All the helpful people on the **Nix/NixOs(unofficial)** discord server.
