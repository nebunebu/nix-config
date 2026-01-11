{ pkgs }:

pkgs.writeShellApplication
  {
    name = "compress4discord";
    runtimeInputs = with pkgs; [
      ffmpeg
      gawk
      coreutils
    ];

    text = builtins.readFile ./compress4discord.sh;
  }

  pkgs.writeShellApplication
  {
    name = "discord_dumper";
    runtimeInputs = with pkgs; [
      curl
      coreutils
      findutils
      gnugrep
    ];

    text = builtins.readFile ./discord_dumper.sh;
  }

  pkgs.writeShellApplication
  {
    name = "generate_password";
    runtimeInputs = with pkgs; [
      pwgen
      wl-clipboard
      libnotify
    ];

    text = builtins.readFile ./generate_password.sh;
  }
