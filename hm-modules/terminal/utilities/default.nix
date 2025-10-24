{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.terminal.utilities;
in
{
  imports = [
    ./aichat
    ./bat.nix
    ./bottom.nix
    ./cava.nix
    ./cli-tools.nix
    ./direnv.nix
    ./eza.nix
    ./fastfetch.nix
    ./fd.nix
    ./jq.nix
    ./lazygit.nix
    ./manix.nix
    ./nh.nix
    ./nix-index.nix
    ./nix-tools.nix
    ./ripgrep.nix
    ./tealdeer.nix
    ./yazi.nix
    ./yt-dlp.nix
    ./zoxide.nix
  ];

  options.neb.terminal.utilities = {
    enable = lib.mkEnableOption "enable terminal utilities";
  };

  config = lib.mkIf cfg.enable {
    neb.terminal.utilities = {
      aichat.enable = true;
      bat.enable = true;
      bottom.enable = true;
      cava.enable = true;
      cli-tools.enable = true;
      direnv.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fd.enable = true;
      jq.enable = true;
      lazygit.enable = true;
      manix.enable = true;
      nh.enable = true;
      nix-index.enable = true;
      nix-tools.enable = true;
      ripgrep.enable = true;
      tealdeer.enable = true;
      yazi.enable = true;
      yt-dlp.enable = true;
      zoxide.enable = true;
    };
  };
}
