{ inputs }:

inputs.nixpkgs.legacyPackages
|> builtins.mapAttrs (
  _system: pkgs: {
    compress4discord = pkgs.writeShellApplication {
      name = "compress4discord";
      runtimeInputs = with pkgs; [
        ffmpeg
        gawk
        coreutils
      ];
      text = builtins.readFile ./compress4discord.sh;
    };

    discord_dumper = pkgs.writeShellApplication {
      name = "discord_dumper";
      runtimeInputs = with pkgs; [
        curl
        coreutils
        findutils
        gnugrep
      ];

      text = builtins.readFile ./discord_dumper.sh;
    };

    generate_password = pkgs.writeShellApplication {
      name = "generate_password";
      runtimeInputs = with pkgs; [
        pwgen
        wl-clipboard
        libnotify
      ];
      text = builtins.readFile ./generate_password.sh;
    };

    # (pkgs.writeShellApplication {
    #   name = "roseify";
    #   runtimeInputs = [ pkgs.lutgen ];
    #   text = # sh
    #     ''
    #       lutgen apply "$1" -o "roseified-$1" -p rose-pine
    #     '';
    # })

    # (pkgs.writeShellApplication {
    #   name = "download_nixpkgs_cache_index";
    #   runtimeInputs = [ pkgs.wget ];
    #   text = # sh
    #     ''
    #       filename="index-$(uname -m | sed 's/^arm64$/aarch64/')-$(uname | tr '[:upper:]' '[:lower:]')"
    #       mkdir -p ~/.cache/nix-index && cd ~/.cache/nix-index
    #       wget -q -N "https://github.com/nix-community/nix-index-database/releases/latest/download/$filename"
    #       ln -f "$filename" files
    #     '';
    # })

  }
)
