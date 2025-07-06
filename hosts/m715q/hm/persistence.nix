{
  home.persistence."/persistent/home/nebu" = {
    directories = [
      "Downloads"
      "Documents"
      ".ssh"
      ".gpupg"
      ".nix-config"
      "Downloads"
      "Documents"
    ];
    files = [
      ".screenrc"
    ];
    # NOTE:
    # Useful for sudo operations, Docker, etc.
    # Requires the NixOS configuration
    # programs.fuse.userAllowOther = true.
    allowOther = true;
  };
}
