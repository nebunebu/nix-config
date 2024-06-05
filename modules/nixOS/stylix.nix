{ pkgs, ... }:

{
  stylix = {
    image = /home/nebu/.config/wallpapers/liminal-tv.jpg;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePineDawn-Linux";
    };

    fonts = {
      serif = {
        package = pkgs.inriafonts;
        name = "Inria Serif";
      };

      sansSerif = {
        package = pkgs.inriafonts;
        name = "Inria Sans";
      };

      monospace = {
        package = pkgs.borg-sans-mono;
        name = "Borg Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Emoji";
      };
    };
  };
}