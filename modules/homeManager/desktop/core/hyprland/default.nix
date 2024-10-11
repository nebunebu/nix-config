{ inputs
, pkgs
, lib
, config
, ...
}:
let
  cfg = config.desktop.core.hyprland;
in
{
  imports = [
    ./keybinds
    ./plugins
    ./pyprland
    ./hypridle.nix
    # ./hyprlock.nix
    ./hyprgrass.nix
    ./t5610.nix
    ./x230t.nix
  ];

  options.desktop.core.hyprland.enable = lib.mkEnableOption "enable hyprland";

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.hyprwayland-scanner.packages."${pkgs.system}".default
      pkgs.wl-clipboard
      pkgs.wf-recorder
      pkgs.grim
      pkgs.slurp
      pkgs.wev
      pkgs.cliphist
      (pkgs.writeShellScriptBin "hypr-start" ''
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
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      xwayland.enable = true;
      systemd = {
        enable = true;
        variables = [ "-all" ];
      };

      extraConfig = ''
        exec-once = hypr-start
      '';

      settings = {
        dwindle = {
          preserve_split = true;
        };
        decoration = {
          "rounding" = "10";
          "active_opacity" = "1";
          "inactive_opacity" = "1";
        };

        windowrulev2 = lib.mkForce [
          "bordercolor rgb(${config.stylix.base16Scheme.palette.base0D}), floating:1"
          "bordercolor rgb(${config.stylix.base16Scheme.palette.base0B}), fullscreen:1"
        ];

        general = {
          "gaps_in" = "7";
          "gaps_out" = "8";
          "border_size" = "2";
          "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.palette.base09})";
        };
        misc = {
          "disable_hyprland_logo" = "true";
          "disable_splash_rendering" = "true";
          "mouse_move_enables_dpms" = "true";
          "key_press_enables_dpms" = "false";
          "enable_swallow" = "true";
          "swallow_regex" = [ "kitty" ];
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
