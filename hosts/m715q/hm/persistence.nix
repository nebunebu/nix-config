{
  home.persistence."/persistent/home/nebu" = {
    directories = [
      "Downloads"
      "Documents"
      ".ssh"
      # {
      #   directory = ".local/share/Steam";
      #   method = "symlink";
      # }
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
