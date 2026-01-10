{ pkgs, ... }:
{
  imports = [
    ./communications
    ./fs-tools
    ./nix-tools
    ./terminal-emulators
    ./taskwarrior
    ./jellyfin-desktop.nix

    ./shells/zsh
    ./shells/starship.nix

    ./web-browsers

    ./window-managers

    ./anki.nix
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
    ./gtk.nix
    ./hyprshot.nix
    ./inkscape.nix
    ./jq.nix
    ./lazygit.nix
    ./libreoffice.nix
    ./libnotify.nix
    ./llm-agents.nix
    ./mpv.nix
    ./newsboat.nix
    ./newsraft.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./pinta.nix
    ./pup.nix
    ./pyradio.nix
    ./qgis.nix
    ./sioyek
    ./sops.nix
    ./spotube.nix
    ./syncthing.nix
    ./tmux.nix
    ./tuir.nix
    ./usbutils.nix
    ./wvkbd.nix
    ./xdg.nix
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

  hm = {
    gtk.enable = true;
    llm-agents.enable = true;
    fs-tools.enable = true;
    nix-tools.enable = true;
    terminal-emulators.enable = true;
    web-browsers.enable = true;
    communications.enable = true;
    jellyfin-desktop.enable = true;

    dev.awscli.enable = true;
    bottom.enable = true;
    buku.enable = true;
    caligula.enable = true;
    cava.enable = true;
    davinci-resolve.enable = false;
    direnv-instant.enable = true;
    direnv.enable = true;
    distrobox.enable = true;
    dms.enable = true;
    fastfetch.enable = true;
    freecad.enable = false;
    fzf.enable = true;
    gimp.enable = false;
    git.enable = true;
    dev.go.enable = true;
    hyprshot.enable = true;
    inkscape.enable = false;
    jq.enable = true;
    lazygit.enable = true;
    libnotify.enable = true;
    mpv.enable = true;
    newsboat.enable = true;
    newsraft.enable = true;
    obs-studio.enable = true;
    pavucontrol.enable = true;
    pinta.enable = true;
    pup.enable = true;
    pyradio.enable = true;
    qgis.enable = true;
    sioyek.enable = true;
    sops.enable = true;
    spotube.enable = false;
    services.syncthing.enable = true;
    taskwarrior.enable = true;
    tmux.enable = true;
    tuir.enable = true;
    usbutils.enable = true;
    wvkbd.enable = true;
    xdg.enable = true;
    yt-dlp.enable = true;

    window-managers = {
      hyprland = {
        enable = true;
        # x230t.enable = true;
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
