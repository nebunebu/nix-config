{
  lib,
  config,
  ...
}:
let
  cfg = config.opts.nix-tools;
in
{
  imports = [
    ./manix.nix
    ./nh.nix
    ./nix-index.nix
    ./nix-inspect.nix
    ./nixpkgs-fmt.nix
    # ./nixpkgs-hammering.nix
    ./nurl.nix
    ./nvd.nix
    ./statix.nix
    ./vimPluginsUpdater.nix
  ];

  options.opts.nix-tools = {
    enable = lib.mkEnableOption "enable nix-tools";
  };

  config = lib.mkIf cfg.enable {
    opts.nix-tools = {
      manix.enable = true;
      nh.enable = true;
      nix-index.enable = true;
      nix-inspect.enable = true;
      nixpkgs-fmt.enable = true;
      nurl.enable = true;
      nvd.enable = true;
      statix.enable = true;
      vimPluginsUpdater.enable = true;
    };
  };
}
