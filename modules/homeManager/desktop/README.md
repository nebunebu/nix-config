# Desktop

Mostly gui apps for headed environment.

Configured applications are prefixed with `desktop`.

Applications without configuration are added to
`home.packages` in `./default.nix`

Most styling is done via stylix.

## Options

- `desktop.chromium.enable` "enable chromium"
- `desktop.firefox.enable` "enable firefox"
- `desktop.hyprland.enable` "enable hyprland"
  - `desktop.hyprland.t5610.enable` "enable hyprland config for host t5610"
  - `desktop.hyprland.x230t.enable` "enable hyprland config for host x230t"
  - `desktop.hyprland.hyprexpo.enable` "enable hyprexpo plugin"
  - `desktop.hyprland.hyprgrass.enable` "enable hyprgrass plugin"
  - `desktop.hyprland.pyprland.enable` "enable pyprland plugin"
  - `desktop.hyprland.pyprland.btm.enable` "enable pyprland dropdown for `pkgs.bottom`"
  - `desktop.hyprland.pyprland.claude.enable` "enable pyprland dropdown for `claude.ai`"
  - `desktop.hyprland.pyprland.hmOptions.enable` "enable pyprland dropdown for `home-manager-options.extranix.com`"
  - `desktop.hyprland.pyprland.hmOptions.enable` "enable pyprland dropdown for `home-manager-options.extranix.com`"
  - `desktop.hyprland.pyprland.nixpkgs.enable` "enable pyprland dropdown for `search.nixos.org/packages`"
  - `desktop.hyprland.pyprland.noogle.enable` "enable pyprland dropdown for `noogle.dev`"
  - `desktop.hyprland.pyprland.noogle.enable` "enable pyprland dropdown for `noogle.dev`"
  - `desktop.hyprland.pyprland.spotube.enable` "enable pyprland dropdown for `unstablePkgs.spotube`"
- `desktop.kitty.enable` "enable kitty"
- `desktop.mpv.enable` "enable mpv"
- `desktop.sioyek.enable` "enable sioyek"
- `desktop.vesktop.enable` "enable vesktop"
- `desktop.waybar.enable` "enable waybar"
  - `desktop.waybar.x230t.enable` "enable configuration for X230t host (laptop)"
  - `desktop.waybar.t5610.enable` "enable configuration for t5610 host (dual monitor desktop)"

## TODO

- add better explanations of dropdowns
- maybe consolidate firefox profiles to dropdowns or enable profile when dropdown is enabled
- would be good to not have term dropdowns depend on term
emulator
- add switches for other hyprland-plugins
- put all hyprland plugins under `desktop.hyprland.plugins.` (maybe)
- maybe add some stuff from hyprland ecosystem like hypridle
- change waybar charging color to cyan
- change waybar urgent color to yellow
- fix swaync css not reloading
- fix wallpapers to be set with `{, ./path}` or just fetched
- [ ] add previews to read me for different options
- [ ] add kebihelp
- [ ] add qbittorrent
- [ ] add sound
- [ ] add swww
- [ ] gimp
- [ ] krita
- [ ] obs
- [ ] toggle opacity for hyprland windows
- [ ] lookup that blog on how to mk docs
- [ ] add jellyfin client

### wrap in modules with prefix desktop

- [x] chromium
- [x] firefox
  - [ ] modularize profiles
- [x] fuzzel
- [x] hyprland
- [x] kitty.nix
- [x] mpv.nix
  - [ ] may add switch for mpv-shim
- [x] sioyek.nix
- [x] vesktop.nix
  - [ ] fix style
- [ ] wallpapers
- [x] waybar
- [ ] xournalpp.nix
    - [ ] write custom hm-module

## Issues

- [ ] `wallpaper does not change on screen rotation`
- [ ] `swaync css reload fails`
- [ ] `fix swaync to specific output`
