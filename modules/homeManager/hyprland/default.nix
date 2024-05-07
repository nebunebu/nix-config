{ inputs, pkgs, lib, config, ... }:
let
  c = config.colorScheme.palette;
  c-gray = "0xff${c.base07}";
  c-red = "0xff${c.base08}";
  c-yellow = "0xff${c.base09}";
  c-lteal = "0xff${c.base0C}";
  c-purple = "0xff${c.base0D}";
in
{
  imports = [
    ./keybinds
    ./pyprland
    ./t5610
    ./x230t
  ];

  options = {
    app.hyprland.enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf
    config.app.hyprland.enable
    {
      home.packages = [
        pkgs.wl-clipboard
        pkgs.wf-recorder
        pkgs.grim
        pkgs.slurp
        pkgs.wev
        pkgs.cliphist
        (pkgs.writeShellScriptBin "hypr-start" ''
          # /nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1 &
          # ${config.home.homeDirectory}/.nix-profile/bin/ags &
          ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store &
          ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store &
          ${inputs.pyprland.packages.x86_64-linux.default}/bin/pypr
        '')
      ];

      home.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };

      wayland.windowManager.hyprland = {
        enable = true;
        # package = unstablePkgs.hyprland;
        xwayland.enable = true;
        systemd = {
          enable = true;
          variables = [ "-all" ];
        };

        extraConfig = ''
          exec-once = hypr-start
        '';

        settings = {
          decoration = {
            "rounding" = "10";
            "active_opacity" = "1";
            "inactive_opacity" = "1";
          };
          windowrulev2 = [
            "bordercolor ${c-purple}, fullscreen:1"
            "bordercolor ${c-lteal}, floating:1"
            "bordercolor ${c-red}, pinned:1"
          ];
          general = {
            "gaps_in" = "7";
            "gaps_out" = "8";
            "border_size" = "2";
            "col.active_border" = "${c-yellow}";
            "col.inactive_border" = "${c-gray}";
          };
          misc = {
            "disable_hyprland_logo" = "true";
            "disable_splash_rendering" = "true";
            "mouse_move_enables_dpms" = "true";
            "key_press_enables_dpms" = "false";
            "enable_swallow" = "true";
            "swallow_regex" = [
              "kitty"
            ];
          };
          input = {
            "kb_layout" = "us";
            "kb_options" = "caps:escape";
            "follow_mouse" = "1";
          };
        };
      };
    };
}
