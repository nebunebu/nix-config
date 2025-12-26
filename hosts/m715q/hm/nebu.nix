{
  lib,
  self,
  ...
}:

{
  imports = [
    "${self}/hm-modules"
    # ../../../hm-modules/terminal/shell/default.nix
    ../../../hm-modules/development/git.nix
    ../../../hm-modules/desktop/utilities/ghostty.nix
    ./beets.nix
  ];

  home = {
    stateVersion = "23.11";
    username = "nebu";
    homeDirectory = lib.mkForce "/home/nebu";
  };

  hm = {
    terminal-emulators.ghostty.enable = true;
    git.enable = true;
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bash.enable = true;
    zsh.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
