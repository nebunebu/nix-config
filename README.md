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

## Usage

In theory you should be able to clone, disable sops-nix and the applications that
depend on it (tuir for instance), change the user password, and run a `sudo
nixos-rebuild switch --flake ./[pathtoclone]#host` and use, but I have not
confirmed this.

I have some intention to set up a guest user and amending this readme with a simple
installation guide, although it may be a long time until I get around to it.

## Showcase

### Display Manager

![Display Manager](https://private-user-images.githubusercontent.com/87451010/365465304-090c9ffa-8217-4916-922b-ee6a5e7c6af8.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjU4Mjc2NjIsIm5iZiI6MTcyNTgyNzM2MiwicGF0aCI6Ii84NzQ1MTAxMC8zNjU0NjUzMDQtMDkwYzlmZmEtODIxNy00OTE2LTkyMmItZWU2YTVlN2M2YWY4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTA4VDIwMjkyMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWNlMTMxYTg4YmE2YmFlMjFhYWUyMTk2NzM4OTMwOWUzZjliNmMzNmJiNzQ1OTVmNzdmM2MzNDViMjBiOGFiZTMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.ngO4L_T5rR6cW0e8t15m1oxYw1xepVjv5ZZB6Fc_Obo)

- Some gold accenting is not captured in preview

### Desktop

#### t5610

![Monitor 1](https://private-user-images.githubusercontent.com/87451010/365465233-4c6dd083-683a-41ec-8f7e-ab0b53d07fc7.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjU4Mjc2NjIsIm5iZiI6MTcyNTgyNzM2MiwicGF0aCI6Ii84NzQ1MTAxMC8zNjU0NjUyMzMtNGM2ZGQwODMtNjgzYS00MWVjLThmN2UtYWIwYjUzZDA3ZmM3LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTA4VDIwMjkyMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTE3OGJjNDE2NTQ2YWRkYmYzMTkzZjk5NWQyMjNlZTc5MTVkMzllOTM2NTM1YThjOTAzMDRmYTFhMjVlNTE2YmEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.Bx727_dtq_JG2qiB4JltdAMWASmtZcq82zDme2EeFFk)

![Monitor 2](https://private-user-images.githubusercontent.com/87451010/365465996-5dbbc7ae-c4f9-4d0e-9456-76ac75ee82c7.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjU4Mjg1MjQsIm5iZiI6MTcyNTgyODIyNCwicGF0aCI6Ii84NzQ1MTAxMC8zNjU0NjU5OTYtNWRiYmM3YWUtYzRmOS00ZDBlLTk0NTYtNzZhYzc1ZWU4MmM3LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTA4VDIwNDM0NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWY0NzBkNjQ3NzkzNjM1NDgzZWRkOWIwNGFmZDQ0MjU4YjBmOWQwYmVjMWM5NzdkZjE4MjVhOGE1NzliMDU0MTUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.LwwF9XtIexM2iekupzieU029ErgnnVcnlaA-9ryB3EY)
<!-- #### x230t -->

<!-- - TODO: add -->
### Terminal

![Terminal](https://private-user-images.githubusercontent.com/87451010/365465242-e8d8394f-c079-4818-9fa9-107218585516.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjU4Mjc2NjIsIm5iZiI6MTcyNTgyNzM2MiwicGF0aCI6Ii84NzQ1MTAxMC8zNjU0NjUyNDItZThkODM5NGYtYzA3OS00ODE4LTlmYTktMTA3MjE4NTg1NTE2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTA4VDIwMjkyMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTA5Yzg5YjM4NjUwNTM2MTBhZWYxYmQxY2EzZGY5NWVmMGI5MDllZjg0ODI5YjQxYjg4NDFkNThmNjM3MTU2YzEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.jrk0zcTVXHOa-cDw3KM26Uur6X7afjfczlONPk0bt2Q)

- tmux bar and panes
- newsboat
- nitch
- tuir
- fzf completion

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

## Contributing

Even though this is a personal configuration, submitting issues suggesting improvements
are welcomed. (I'm flying by the seat of my pants.)

## Special Thanks

All the helpful people on the **Nix/NixOs(unofficial)** discord server.
