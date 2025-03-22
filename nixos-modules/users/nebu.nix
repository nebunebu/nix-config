{ pkgs, ... }:

{

  # sops.secrets.nebu-password.neededForUsers = true;

  users = {
    mutableUsers = false;
    users.nebu = {
      name = "nebu";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "video"
        "pipewire"
        "render"
      ];
      # initialPassword = "password";
      hashedPassword = "$y$j9T$BrkDt/ClWWO.T/9z5EHYM0$uzInWXBqPfgUZgdM0JWQuHV7aIT.857sysLoz872Hl3";
      # hashedPasswordFile = config.sops.secrets.nebu-password.path;
    };
  };
}
