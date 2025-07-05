{
  inputs,
  ...
}:

{
  imports = [
    "${inputs.self}/hm-modules"
    # ./persistence.nix
  ];

  home = {
    stateVersion = "23.11";
  };

  neb = {
    services.syncthing.enable = true;
    profile = {
      # development.enable = true;
      terminal.enable = true;
    };
  };
}
