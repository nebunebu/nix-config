{ self, lib, pkgs, unstablePkgs, ... }:

let
  fromYAML = file:
    let
      json = pkgs.runCommand "converted.json" { } ''
        ${lib.meta.getExe pkgs.yj} < ${file} > $out
      '';
    in
    builtins.fromJSON (builtins.readFile json);
in
{
  environment.systemPackages = [
    (unstablePkgs.nerdfonts.override {
      fonts = [
        "DroidSansMono"
        "JetBrainsMono"
      ];
    })
  ];

  stylix = {
    enable = true;
    image = "${self}/modules/homeManager/desktop/wallpapers/liminal-tv.jpg";
    # base16Scheme =
    #   fromYAML "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
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
