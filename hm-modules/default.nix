{ pkgs, ... }:
{
  imports = [
    # NOTE: add
    # taskwarrior3
    # jellyfin-media-player
    # openpomodoro-cli
    # calcure
    # libreoffice
    # gimp3-with-plugins
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
    ./communications
    ./fs-tools
    ./nix-tools
    ./terminal-emulators

    ./shells/zsh
    ./shells/starship.nix

    ./web-browsers

    ./window-managers

    ./awscli.nix
    ./bottom.nix
    ./buku.nix
    ./caligula.nix
    ./cava.nix
    ./direnv.nix
    ./direnv-instant.nix
    ./dms.nix
    ./fastfetch.nix
    ./freecad.nix
    ./fzf.nix
    ./git.nix
    ./go.nix
    ./hyprshot.nix
    ./jq.nix
    ./lazygit.nix
    ./libnotify.nix
    ./mpv.nix
    ./newsboat.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./pup.nix
    ./pyradio.nix
    ./sioyek.nix
    ./sops.nix # not wrapped with option
    ./spotube.nix
    ./syncthing.nix
    ./tealdeer.nix
    ./tmux.nix
    ./tuir.nix
    ./usbutils.nix
    ./wvkbd.nix
    ./xdg.nix # not wrapped with option
    ./yt-dlp.nix
  ];

  home.packages = [
    (pkgs.writeShellApplication {
      name = "roseify";
      runtimeInputs = [ pkgs.lutgen ];
      text = # sh
        ''
          lutgen apply "$1" -o "roseified-$1" -p rose-pine
        '';
    })
  ];

  opts = {
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
    direnv-instant.enable = true;
    direnv.enable = true;
    dms.enable = true;
    fastfetch.enable = true;
    freecad.enable = true;
    fzf.enable = true;
    git.enable = true;
    dev.go.enable = true;
    hyprshot.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    libnotify.enable = true;
    mpv.enable = true;
    newsboat.enable = true;
    obs-studio.enable = true;
    pavucontrol.enable = true;
    pup.enable = true;
    pyradio.enable = true;
    sioyek.enable = true;
    spotube.enable = true;
    services.syncthing.enable = true;
    tealdeer.enable = true;
    tmux.enable = true;
    tuir.enable = true;
    usbutils.enable = true;
    wvkbd.enable = true;
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
