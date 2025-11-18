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
}
