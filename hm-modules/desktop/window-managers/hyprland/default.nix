{ inputs
, pkgs
, lib
, config
, ...
}:
let
  cfg = config.neb.desktop.window-managers.hyprland;
  borderEdgeGradient = col: (
    let
      colorString = c: "rgb(${c}) ";
      firstColor = lib.concatStrings (lib.replicate 5 (colorString col));
      secondColor = lib.concatStrings (lib.replicate 5 (colorString config.stylix.base16Scheme.palette.base00));
    in
    firstColor + secondColor + "211deg"
  );
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
    ./hyprpaper.nix
  ];

  options.neb.desktop.window-managers.hyprland.enable = lib.mkEnableOption "enable hyprland";

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
      HYPRLAND_TRACE = "1";
      AQ_TRACE = "1";
      AQ_DRM_DEVICES = "/dev/dri/card1";
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
        exec-once = tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"
      '';

      settings = {
        dwindle = {
          preserve_split = true;
        };

        # tmp until styix fix
        decoration = lib.mkForce (removeAttrs
          {
            col.shadow = null;
            shadow = {
              enabled = true;
              range = 1;
              render_power = 4;
              sharp = true;
              color = "rgba(25, 23, 36, 1.0)"; # base
              # color = "rgba(246, 193, 119, 1.0)"; # gold
              # color_inactive = "rgba(49, 116, 143, 1.0)"; #pine
              # color_inactive = borderEdgeGradient config.stylix.base16Scheme.palette.base0D;
              ignore_window = false;
              offset = "12 12";
            };

            rounding = "0";
            "active_opacity" = "1";
            "inactive_opacity" = "1";
          } [ "col" ]);

        windowrulev2 = lib.mkForce [
          # base0D
          "bordercolor ${borderEdgeGradient config.stylix.base16Scheme.palette.base0D}, floating:1"
          "bordercolor ${borderEdgeGradient config.stylix.base16Scheme.palette.base0B}, fullscreen:1"
          # "bordercolor ,${borderEdgeGradient config.stylix.base16Scheme.palette.base0D}, fullscreen:1"
        ];

        general = {
          "gaps_in" = "12";
          "gaps_out" = "15";
          "border_size" = "4";
          # "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.palette.base09})  rgb(${config.stylix.base16Scheme.palette.base00}) 200deg;";
          "col.active_border" = lib.mkForce (
            "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 1. Gold
            "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 2. Gold
            "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 3. Gold
            "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 4. Gold
            "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 5. Gold
            "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 6. Black
            "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 7. Black
            "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 8. Black
            "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 9. Black
            "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 10. Black
            "211deg"
          );
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
