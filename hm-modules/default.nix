{ pkgs, ... }:
{
  imports = [
    # NOTE: add
    # taskwarrior3
    # jellyfin-media-player
    # openpomodoro-cli
    # calcure
    # abook
    # stripe-cli
    # hledger
    # krita
    # drawio
    # latexmk
    # add ./nix-tools/nixpkgs-hammering.nix
    # add ./nix-tools/nix-alien.nix
    # add ./nix-tools/deadnix.nix

    ./ai
    # ./anki.nix
    ./communications
    ./fs-tools
    ./nix-tools
    ./terminal-emulators
    ./taskwarrior

    ./shells/zsh
    ./shells/starship.nix

    ./web-browsers

    ./window-managers

    ./awscli.nix
    ./bottom.nix
    ./buku.nix
    ./caligula.nix
    ./cava.nix
    ./davinci-resolve.nix
    ./direnv-instant.nix
    ./direnv.nix
    ./distrobox.nix
    ./dms.nix
    ./fastfetch.nix
    ./freecad.nix
    ./fzf.nix
    ./gimp.nix
    ./git.nix
    ./go.nix
    ./hyprshot.nix
    ./inkscape.nix
    ./jq.nix
    ./lazygit.nix
    ./libreoffice.nix
    ./libnotify.nix
    ./mpv.nix
    ./newsboat.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./pinta.nix
    ./pup.nix
    ./pyradio.nix
    ./qgis.nix
    ./sioyek.nix
    ./sops.nix
    ./spotube.nix
    ./syncthing.nix
    ./tealdeer.nix
    ./tmux.nix
    ./tuir.nix
    ./usbutils.nix
    ./wvkbd.nix
    ./xdg.nix
    ./yt-dlp.nix
  ];

  home.packages = [
    (pkgs.writeShellScriptBin "anki-bin" ''
      ANKI_WAYLAND=1 exec ${pkgs.anki-bin}/bin/anki "$@"
    '')

    (pkgs.writeShellApplication {
      name = "roseify";
      runtimeInputs = [ pkgs.lutgen ];
      text = # sh
        ''
          lutgen apply "$1" -o "roseified-$1" -p rose-pine
        '';
    })
  ];

  hm = {
    ai.enable = true;
    communications.enable = true;
    fs-tools.enable = true;
    nix-tools.enable = true;
    terminal-emulators.enable = true;
    web-browsers.enable = true;

    dev.awscli.enable = true;
    bottom.enable = true;
    buku.enable = true;
    caligula.enable = true;
    cava.enable = true;
    davinci-resolve.enable = true;
    direnv-instant.enable = true;
    direnv.enable = true;
    distrobox.enable = true;
    dms.enable = true;
    fastfetch.enable = true;
    freecad.enable = true;
    fzf.enable = true;
    gimp.enable = true;
    git.enable = true;
    dev.go.enable = true;
    hyprshot.enable = true;
    inkscape.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    libnotify.enable = true;
    mpv.enable = true;
    newsboat.enable = true;
    obs-studio.enable = true;
    pavucontrol.enable = true;
    pinta.enable = true;
    pup.enable = true;
    pyradio.enable = true;
    qgis.enable = true;
    sioyek.enable = true;
    sops.enable = true;
    spotube.enable = true;
    services.syncthing.enable = true;
    taskwarrior.enable = true;
    tealdeer.enable = true;
    tmux.enable = true;
    tuir.enable = true;
    usbutils.enable = true;
    wvkbd.enable = true;
    xdg.enable = true;
    yt-dlp.enable = true;

    window-managers = {
      hyprland = {
        enable = true;
        x230t.enable = true;
        # t5610.enable = true;
        # hyprpicker.enable = true;
        # hyprgrass.enable = true;
        # pyprland.enable = true;
        # hyprpolkitagent.enable = true;
      };
    };

    shell = {
      zsh.enable = true;
      starship.enable = true;
    };
  };
}
