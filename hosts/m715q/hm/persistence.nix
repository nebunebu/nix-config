{
  home.persistence."/persist/home/nebu" = {
    allowOther = true;
    directories = [
      "Downloads"
      "Documents"
      ".ssh"
      ".gnupg"
      ".nix-config"
      ".config/sops/age"
    ];
    files = [
      ".screenrc"
    ];
  };
}
