{
  inputs,
  ...
}:

{
  imports = [
    "${inputs.self}/hm-modules"
    ./nebu.nix
  ];

  home = {
    stateVersion = "23.11";
  };

  hm = {
    services.syncthing.enable = true;
    # ai.enable = true;
    fs-tools.enable = true;
    nix-tools = {
      nh.enable = true;
      nix-index.enable = true;
      nix-inspect.enable = true;
      nixpkgs-fmt.enable = true;
      nurl.enable = true;
      nvd.enable = true;
      statix.enable = true;
    };
    direnv-instant.enable = true;
    direnv.enable = true;
    fastfetch.enable = true;
    bottom.enable = true;
    git.enable = true;
    yt-dlp.enable = true;
    usbutils.enable = true;
    sops.enable = true;
  };
}
