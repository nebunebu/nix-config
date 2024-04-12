{ pkgs, config, lib, ... }:
let
  cfg = config.programs.swww;
  entryToStr = x: "${pkgs.swww}/bin/swww img -o ${x.monitor} ${x.wallpaper}";
in
{
  options = {
    # rewrite with enable to add package
    programs.swww = lib.mkOption {
      type = with lib.types;
        listOf (submodule {
          options = {
            monitor = lib.mkOption { type = str; };
            wallpaper = lib.mkOption { type = str; };
          };
        });
    };
  };

  config = {
    systemd.user.services.swww-wp = {
      Install.WantedBy = [ "default.target" ];
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.writeShellScript "swww-wp" ''
          ${lib.concatLines (map entryToStr cfg)}
        ''}";
      };
    };
  };
}
