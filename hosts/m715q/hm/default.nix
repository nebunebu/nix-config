{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    "${inputs.self}/hm-modules"
    # ./persistence.nix
  ];

  home.packages = [
  ];

  neb = {
    services.syncthing.enable = true;
    profile = {
      # development.enable = true;
      terminal.enable = true;
    };
  };
}
