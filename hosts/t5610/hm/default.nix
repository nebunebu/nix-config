{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    "${inputs.self}/hm-modules"
  ];

  home = {
    stateVersion = "23.11";
    packages = [
      (pkgs.writeShellApplication {
        name = "roseify";
        runtimeInputs = [ pkgs.lutgen ];
        text = # sh
          ''
            lutgen apply "$1" -o "roseified-$1" -p rose-pine
          '';
      })

      # pkgs.drawio
      pkgs.texlivePackages.latexmk
      pkgs.libnotify
    ];

  };

  neb = {
    services.syncthing.enable = true;

    profile = {
      desktop = {
        enable = true;
      };
      development.enable = true;
      terminal.enable = true;
    };

    desktop = {

      window-managers = {
        river.enable = true;
        hyprland = {
          enable = true;
          t5610.enable = true;
          hyprpaper.t5610.enable = true;
          hyprpicker.enable = true;
          pyprland = {
            enable = true;
            # btm.enable = true;
            # hmOptions.enable = true;
            # nixpkgs.enable = true;
            # noogle.enable = true;
            obsidian.enable = true;
          };
        };
      };
    };
  };
}
