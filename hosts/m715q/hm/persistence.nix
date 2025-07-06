{
  home.persistence."/persist/home/nebu" = {
    allowOther = true;
    directories = [
      "Downloads"
      "Documents"
      ".ssh"
      ".gnupg"
      ".config/sops/age"
    ];
    files = [
      ".screenrc"
    ];
  };
}
