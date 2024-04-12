{ config, ... }:
let
  c = config.colorScheme.palette;
in
{
  imports = [
    ./scripts/default.nix
  ];
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "DroidSansM Nerd Font";
        prompt = "󰁔";
        dpi-aware = "auto";
        fuzzy = "yes";
        inner-pad = 10;
        icons-enabled = "no";
        layer = "top";
        exit-on-keyboard-focus-loss = "yes";
      };
      dmenu.mode = "text";
      border = {
        width = 2;
        radius = 10;
      };
      colors = {
        background = "${c.base00}ff";
        text = "${c.base05}ff";
        match = "${c.base0B}ff";
        selection = "${c.base0B}ff";
        selection-text = "${c.base00}ff";
        selection-match = "${c.base0E}ff";
        border = "${c.base0D}ff";
      };
    };
  };
}
