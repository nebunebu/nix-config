{
  inputs,
  ...
}:

{
  imports = [
    "${inputs.self}/hm-modules"
    ./nebu.nix
  ];

  home = {
    stateVersion = "23.11";
  };

  hm = {
    services.syncthing.enable = true;
  };

  # neb = {
  #   services.syncthing.enable = true;
  #   profile = {
  #     development.enable = true;
  #     terminal.enable = true;
  #     desktop = {
  #       enable = true;
  #     };
  #   };
  #   desktop = {
  #     window-managers = {
  #       hyprland = {
  #         enable = true;
  #         t5610.enable = true;
  #         hyprpicker.enable = true;
  #         # pyprland = {
  #         #   enable = true;
  #         # btm.enable = true;
  #         # hmOptions.enable = true;
  #         # nixpkgs.enable = true;
  #         # noogle.enable = true;
  #         # };
  #       };
  #     };
  #   };
  # };
}
