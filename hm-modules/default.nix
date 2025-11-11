{
  imports = [
    ./development
    ./hyprshot.nix
    ./tablet
    ./terminal
    ./xdg.nix
    ./syncthing.nix
    ./sops.nix
    ./dms.nix

    ./terminal-emulators
    ./web-browsers
    ./window-managers
    ./communications

    ./mpv.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./sioyek.nix
  ];

  desktop = {
    communications = {
      vesktop.enable = true;
      thunderbird.enable = true;
    };
    media = {
      sioyek.enable = true;
      mpv.enable = true;
      obs-studio.enable = true;
    };
    pavucontrol.enable = true;
    terminal-emulators = {
      foot.enable = true;
      ghostty.enable = true;
      kitty.enable = true;
    };
    web-browsers = {
      chromium.enable = true;
      firefox.enable = true;
      firefoxpwa.enable = true;
    };
  };
}
