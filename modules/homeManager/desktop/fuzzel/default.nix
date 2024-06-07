{
  imports = [
    ./scripts/default.nix
  ];
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        prompt = "󰁔";
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
      colors = { };
    };
  };
}
