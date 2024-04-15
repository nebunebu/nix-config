{ pkgs, lib, config, ... }:

{
  options = {
    app.git.enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf config.app.git.enable {
    programs.git = {
      enable = true;
      userEmail = "nebu.nebuchadnezzar@gmail.com";
      userName = "nebunebu";
      delta.enable = true;
      extraConfig = {
        init.defaultBranch = "main";
      };
      aliases = {
        st = "status";
        ap = "add -p";
        p = "push";
        b = "branch";
        sw = "switch";
      };
    };
  };
}
