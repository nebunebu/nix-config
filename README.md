# nix-config

> [!Warning]
> These configs are always evolving so the READEME.md
> may not accurately reflect the codebase.
>
> Don't expect to be able to clone this repo and use
> Not having the key for sops-nix will prevent you from
> doing so.

This is my personal flake for my nix-configs.

## Features

- Flake-based Configuration
- Multiple Host Configurations
  - t5610 (desktop)
  - x230t (laptop with tablet functionality)
  - g500s (server)
  - nixISO (iso image)
- Home Manager Integration
- Custom Packages
- Secrets Management with `sops-nix`
- Dev Environment with pre-commit hooks
- System-wide theming with stylix

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

# TODO

- [ ] add installation instructions
- [ ] add image previews
- [ ] migrate to ags

## Special Thanks

All the helpful people on the [**Nix/NixOs(unofficial)**](https://discord.gg/JQTUJdmG) discord server.
