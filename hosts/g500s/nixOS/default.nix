{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    ../../../modules/nixOS/nix.nix
    ../../../modules/nixOS/console.nix
    ../../../modules/nixOS/boot.nix
    ../../../modules/nixOS/system.nix
    ../../../modules/nixOS/networking.nix
    ../../../modules/nixOS/documentation.nix
    ../../../modules/nixOS/users/nebu.nix
  ];

  environment.systemPackages = [
    inputs.nixvim-flake.packages.x86_64-linux.default
    pkgs.vbetool
    # (pkgs.writeShellScriptBin "lid-switch" ''
    # '')
  ];

  services.logind = {
    lidSwitch = "ignore";
    lidSwitchExternalPower = "ignore";
  };

  networking.hostName = "g500s";
  environment = {
    sessionVariables = {
      HOSTNAME = "g500s";
    };
  };
}
