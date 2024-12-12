# nix-config

> [!Warning]
> This codebase is constantly evolving and may (very likely) not
> be accurately reflected in its README.md
>
> Don't expect to be able to clone this repo and use.
> Not having the key for sops-nix will prevent you from
> doing so.

This is my personal flake for my NixOS configurations. It aims to be
modular, navigable, comprehensible, worthy of at least 6 upvotes
on [/r/unixporn](https://reddit.com/r/unixporn), convenient (for me)
to use, and bereft of jankiness.

## Features

- Flake-based Configuration
- Multiple Host Configurations
  - t5610 (desktop)
  - x230t (laptop with tablet functionality)
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
| **Browser:**           | [firefox](https://firefox-source-docs.mozilla.org/contributing/index.html), chromium, |
| **Video Player:**      | [mpv](https://mpv.io/)                                                         |
| **Music:**      | spotube |
| **Pdf Viewer:**        | [sioyek](https://sioyek.info)                                                  |
|                        | [xournalpp](https://github.com/xournalpp/xournalpp)                            |
| **WM:**                | [hyprland](https://github.com/hyprwm/Hyprland)                                 |
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

## Usage

In theory you should be able to clone, disable sops-nix and the applications that
depend on it (tuir for instance), change the user password, and run a `sudo
nixos-rebuild switch --flake ./[pathtoclone]#host` and use, but I have not
confirmed this.

I have some intention to set up a guest user and amending this readme with a simple
installation guide, although it may be a long time until I get around to it.

## Showcase

### Display Manager

![Display Manager](https://i.imgur.com/6DCnnKD.png)

- Some gold accenting is not captured in preview

### Desktop

#### t5610

![Monitor 1](https://i.imgur.com/Mf2ZJSa.png)

![Monitor 2](https://github.com/user-attachments/assets/06d32ea0-4ca5-4d90-b9b8-d2e72426211b)
<!-- #### x230t -->

<!-- - TODO: add -->
### Terminal

![Terminal](https://i.imgur.com/NTDOcdk.png)
 tmux bar and panes - newsboat - nitch - tuir - fzf completion

<!-- - Launcher -->
<!-- - Pdf Viewer -->
<!-- - Neovim -->
<!-- - pyprland dropdowns -->
<!-- - actually using tuir with popup mpv -->
<!-- - actually using newsboat with popups -->

## TODO

- [ ] add installation instructions
- [ ] add image previews
- [ ] migrate to ags
- [ ] set up pkg overlays
- [ ] add host for nix-droid
- [ ] set up impermanence
- [ ] add substituters
- [ ] add CI/CD

## Contributing

Even though this is a personal configuration, submitting issues suggesting improvements
are welcomed. (I'm flying by the seat of my pants.)

## Special Thanks

All the helpful people on the **Nix/NixOs(unofficial)** discord server.
