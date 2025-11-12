{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.nix-tools.nix-index;
in
{
  options.opts.nix-tools.nix-index = {
    enable = lib.mkEnableOption "enable nix-index";
  };

  config = lib.mkIf cfg.enable {

    programs = {
      nix-index = {
        enable = true;
        enableZshIntegration = true;
      };
    };
    home.packages = [
      pkgs.comma
      (pkgs.writeShellApplication {
        name = "download_nixpkgs_cache_index";
        runtimeInputs = [ pkgs.wget ];
        text = # sh
          ''
            filename="index-$(uname -m | sed 's/^arm64$/aarch64/')-$(uname | tr '[:upper:]' '[:lower:]')"
            mkdir -p ~/.cache/nix-index && cd ~/.cache/nix-index
            wget -q -N "https://github.com/nix-community/nix-index-database/releases/latest/download/$filename"
            ln -f "$filename" files
          '';
      })
    ];
  };
}
