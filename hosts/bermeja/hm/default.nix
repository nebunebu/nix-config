{
  inputs,
  ...
}:

{
  imports = [
    "${inputs.self}/hm-modules/bermeja.nix"
  ];

  home = {
    stateVersion = "23.11";
    username = "nebu";
  };

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    zsh.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
