{
  imports = [
    ./direnv-instant.nix
    ./direnv.nix
    ./fastfetch.nix
    ./fs-tools
    ./fzf.nix
    ./git.nix
    ./go.nix
    ./gpg.nix
    ./gtk.nix
    ./jq.nix
    ./lazygit.nix
    ./llm-agents.nix
    ./nix-tools
    ./pass.nix
    ./shells/starship.nix
    ./shells/zsh
    ./sops.nix
    ./syncthing.nix
    ./taskwarrior
    ./usbutils.nix
    ./xdg.nix
    ./yt-dlp.nix
  ];

  home.pointerCursor.enable = true;

  hm = {
    direnv-instant.enable = true;
    direnv.enable = true;
    fastfetch.enable = true;
    fs-tools.enable = true;
    fzf.enable = true;
    git.enable = true;
    gpg.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    llm-agents.enable = true;
    nix-tools.enable = true;
    pass.enable = true;
    services.syncthing.enable = true;
    shell = {
      zsh.enable = true;
      starship.enable = true;
    };
    sops.enable = true;
    taskwarrior.enable = true;
    usbutils.enable = true;
    xdg.enable = true;
    yt-dlp.enable = true;
  };
}
