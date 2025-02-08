# nix-config

> [!Warning]
> This codebase is constantly evolving and may (very likely) not
> be accurately reflected in its README.md
>
> Don't expect to be able to clone this repo and use.
> Not having the key for sops-nix will prevent you from
> doing so.

This is my personal flake for my NixOS configurations.

## Features

- Flake-based Configuration
- Multiple Host Configurations
  - t5610 (desktop)
  - x230t (laptop)
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
| **Terminal:**          | [ghostty](https://ghostty.org/)                                   |
| **Multiplexer:**       | [tmux](https://github.com/tmux/tmux)                                           |
|                        |                                                                                |
| **Browser:**           | [firefox](https://firefox-source-docs.mozilla.org/contributing/index.html), chromium, |
| **Video Player:**      | [mpv](https://mpv.io/)                                                         |
| **Music:**      | spotube |
| **Pdf Viewer:**        | [sioyek](https://sioyek.info)                                                  |
|                        | [xournalpp](https://github.com/xournalpp/xournalpp)                            |
| **WM:**                | [hyprland](https://github.com/hyprwm/Hyprland)                                 |
| **Launcher:**          | [fuzzel](https://codeberg.org/dnkl/fuzzel)                                     |
| **Bar**          | [hyprpanel](https://hyprpanel.com/)                                     |
| **Secrets provision:** | [sops-nix](https://github.com/Mic92/sops-nix)                                  |

## Structure

```sh
.
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

## Contributing

Even though this is a personal configuration, submitting issues suggesting improvements
are welcomed. (I'm flying by the seat of my pants.)

## Special Thanks

All the helpful people on the **Nix/NixOs(unofficial)** discord server.
