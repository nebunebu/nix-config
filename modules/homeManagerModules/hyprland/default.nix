{ inputs, pkgs, unstablePkgs, lib, config, ... }:
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
    ./pyprland
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
        pkgs.swww
        pkgs.cliphist
        (pkgs.writeShellScriptBin "hypr-start" ''
          # /nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1 &
          # ${config.home.homeDirectory}/.nix-profile/bin/ags &
          ${pkgs.waybar}/bin/waybar &
          ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store &
          ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store &
          ${pkgs.swww}/bin/swww init
          ${inputs.pyprland.packages.x86_64-linux.default}/bin/pypr
        '')
      ];

      home.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };

      wayland.windowManager.hyprland = {
        # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
        enable = true;
        xwayland.enable = true;
        systemd = {
          enable = true;
          variables = [ "-all" ];
        };

        extraConfig = ''
          env = HYPRCURSOR_THEME,rose-pine-hyprcursor
          env = HYPRCURSOR_SIZE,24
          exec-once = hypr-start
        '';


        settings = {
          # TODO: add exec-once hypr-start
          # TODO: add submaps for resizing and moving floating windows
          # TODO: add hyprcursor
          monitor = [
            "DP-1, 1920x1080, 0x0, 1"
            "DP-2, 1920x1080, 1920x0, 1"
          ];

          workspace = [
            "1, monitor:DP-1"
            "2, monitor:DP-1"
            "3, monitor:DP-1"
            "4, monitor:DP-1"
            "5, monitor:DP-1"
            "6, monitor:DP-2"
            "7, monitor:DP-2"
            "8, monitor:DP-2"
            "9, monitor:DP-2"
            "10, monitor:DP-2"
          ];


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
          "$mainMod" = "SUPER";

          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];

          binde = [
            ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%-"
            ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
          ];

          bind = [
            "$mainMod + SHIFT, N, movewindow, mon:DP-1"
            "$mainMod + SHIFT, M, movewindow, mon:DP-2"

            "$mainMod, INSERT, exec, power-menu"
            ",XF86KbdBrightnessDown, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"

            "$mainMod, ALT_R, exec, screen-capture"

            "$mainMod, X, killactive"
            "$mainMod, M, fullscreen, 1"
            "$mainMod, F, togglefloating"
            "$mainMod, V, exec, cliphist-menu"

            "$mainMod + SHIFT, Return, exec, kitty"
            "$mainMod, Return, exec, kitty zsh -c \"tmux new-session -A -s \"main\"\""
            "$mainMod, I, exec, firefox"
            "$mainMod, P, exec, fuzzel"

            "$mainMod, H, movefocus, l"
            "$mainMod, L, movefocus, r"
            "$mainMod, K, movefocus, u"
            "$mainMod, J, movefocus, d"

            "$mainMod + SHIFT, H, movewindow, l"
            "$mainMod + SHIFT, L, movewindow, r"
            "$mainMod + SHIFT, K, movewindow, u"
            "$mainMod + SHIFT, J, movewindow, d"

            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"

            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
          ];
        };
      };
    };
}
