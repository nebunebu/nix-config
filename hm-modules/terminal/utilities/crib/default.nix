{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.crib;
in
{
  options.neb.terminal.utilities.crib = {
    enable = lib.mkEnableOption "enable crib";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.callPackage ../../../../pkgs/crib.nix { })
    ];

    xdg.configFile."crib/bindings.yaml".source = pkgs.writers.writeYAML "crib-bindings.yaml" (
      (builtins.import ./hyprland.nix)
      ++ (builtins.import ./neovim.nix)
      ++ (builtins.import ./sioyek.nix)
      ++ (builtins.import ./tmux.nix)
      ++ (builtins.import ./tridactyl.nix)
      ++ (builtins.import ./vesktop.nix)
      ++ (builtins.import ./yazi.nix)
      ++ (builtins.import ./zsh.nix)
    );
  };
}
