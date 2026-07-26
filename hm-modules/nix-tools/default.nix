{
  lib,
  config,
  ...
}:
let
  cfg = config.hm.nix-tools;
in
{
  imports = [
    ./manix.nix
    ./nh.nix
    ./nix-index.nix
    ./nix-inspect.nix
    ./nixpkgs-fmt.nix
    # ./nixpkgs-hammering.nix
    ./noogle-search.nix
    ./nurl.nix
    ./nvd.nix
    ./statix.nix
    ./vimPluginsUpdater.nix
  ];

  options.hm.nix-tools = {
    enable = lib.mkEnableOption "enable nix-tools";
  };

  config = lib.mkIf cfg.enable {
    hm.nix-tools = {
      manix.enable = lib.mkDefault true;
      nh.enable = lib.mkDefault true;
      nix-index.enable = lib.mkDefault true;
      nix-inspect.enable = lib.mkDefault true;
      nixpkgs-fmt.enable = lib.mkDefault true;
      noogle-search.enable = lib.mkDefault true;
      nurl.enable = lib.mkDefault true;
      nvd.enable = lib.mkDefault true;
      statix.enable = lib.mkDefault true;
      vimPluginsUpdater.enable = lib.mkDefault true;
    };
  };
}
