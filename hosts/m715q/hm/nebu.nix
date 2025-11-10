{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    # ../../../hm-modules/terminal/shell/default.nix
    ../../../hm-modules/development/git.nix
    ../../../hm-modules/desktop/utilities/ghostty.nix
    ../../../hm-modules/development/git.nix
  ];

  home = {
    stateVersion = "23.11";
    username = "nebu";
    homeDirectory = lib.mkForce "/home/nebu";
    packages = [
      inputs.gemini-cli.packages."${pkgs.stdenv.hostPlatform.system}".default
      pkgs.aichat
    ];
  };

  neb = {
    desktop.utilities.ghostty.enable = true;
    development.git.enable = true;
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bash.enable = true;
    zsh.enable = true;
  };

  # nixpkgs.config = { allowUnfree = true; };
  systemd.user.startServices = "sd-switch";
}
