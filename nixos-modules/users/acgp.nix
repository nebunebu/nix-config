{ pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users.acgp = {
      name = "acgp";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "video"
        "networkmanager"
        "pipewire"
        "render"
      ];
      hashedPassword = "$y$j9T$BrkDt/ClWWO.T/9z5EHYM0$uzInWXBqPfgUZgdM0JWQuHV7aIT.857sysLoz872Hl3";
    };
  };
}
