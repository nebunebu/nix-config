{ lib, config, pkgs, ... }:
# TODO: override systray icon
# TODO: put style in seperate file
let
  cfg = config.desktop.vesktop;
in
{
  options.desktop.vesktop = {
    enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      # CREDIT: https://github.com/raidenovich/OuterHeaven/blob/850546a45382efd76a1776a988e278dc4c7fac3b/modules/home-manager/gui/vesktop.nix#L4
      (pkgs.vesktop.overrideAttrs {
        # withSystemVencord = true;
        desktopItems = [
          (pkgs.makeDesktopItem {
            name = "vesktop";
            desktopName = "Vesktop";
            exec = "vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
            icon = "discord";
            startupWMClass = "VencordDesktop";
            genericName = "Internet Messenger";
            keywords = [ "discord" "vencord" "electron" "chat" ];
            categories = [ "Network" "InstantMessaging" "Chat" ];
          })
        ];
      })
    ];

  };

  # FIX: Module `/nix/store/s2507f9vcj3cqj55755a01mp6fw5skpr-source/modules/homeManager/desktop/vesktop.nix' has an unsupported attribute `xdg'. This is caused by introducing a top-level `config' or `options' attribute. Add configuration attributes immediately on the top level instead, or move all of them (namely: xdg) into the explicit `config' attribute.
  # xdg.configFile."vesktop/themes/custom.theme.css".text =
  #   let
  #     palette = config.stylix.base16Scheme.palette;
  #   in
  #     /* css */ ''
  #     :root {
  #         --base00: #${palette.base01}; /* Black */
  #         --base01: #${palette.base02}; /* Bright Black */
  #         --base02: #26233a; /* Grey */
  #         --base03: #${palette.base04}; /* Brighter Grey */
  #         --base04: #${palette.base07}; /* Bright Grey */
  #         --base05: #${palette.base05}; /* White */
  #         --base06: #e0def4; /* Brighter White */
  #         --base07: #524f67; /* Bright White */
  #         --base08: #eb6f92; /* Red */
  #         --base09: #f6c177; /* Orange */
  #         --base0A: #ebbcba; /* Yellow */
  #         --base0B: #31748f; /* Green */
  #         --base0C: #9ccfd8; /* Cyan */
  #         --base0D: #c4a7e7; /* Blue */
  #         --base0E: #f6c177; /* Purple */
  #         --base0F: #524f67; /* Magenta */
  #
  #         --primary-630: var(--base00); /* Autocomplete background */
  #         --primary-660: var(--base00); /* Search input background */
  #     }
  #
  #     .theme-light, .theme-dark {
  #         --search-popout-option-fade: none; /* Disable fade for search popout */
  #         --bg-overlay-2: var(--base00); /* These 2 are needed for proper threads coloring */
  #         --home-background: var(--base00);
  #         --background-primary: var(--base00);
  #         --background-secondary: var(--base01);
  #         --background-secondary-alt: var(--base01);
  #         --channeltextarea-background: var(--base01);
  #         --background-tertiary: var(--base00);
  #         --background-accent: var(--base0E);
  #         --background-floating: var(--base01);
  #         --background-modifier-hover: #1917244c; /* 30% of base00 */
  #         --background-modifier-selected: var(--base00);
  #         --text-normal: var(--base05);
  #         --text-secondary: var(--base00);
  #         --text-muted: var(--base03);
  #         --text-link: var(--base0C);
  #         --interactive-normal: var(--base05);
  #         --interactive-hover: var(--base05);
  #         --interactive-active: var(--base07);
  #         --interactive-muted: var(--base03);
  #         --channels-default: var(--base04);
  #         --channel-icon: var(--base04);
  #         --header-primary: var(--base06);
  #         --header-secondary: var(--base03);
  #         --scrollbar-thin-track: transparent;
  #         --scrollbar-auto-track: transparent;
  #     }
  #   '';
}
