{ pkgs
, lib
, config
, ...
}:
let
  cfg = config.neb.amdgpu;
in
{
  options.neb.amdgpu = {
    enable = lib.mkEnableOption "enable amdgpu";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.lact ];

    systemd = {
      packages = [ pkgs.lact ];
      services.lactd.wantedBy = [ "multi-user.target" ];
    };

    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };
    };

    boot = {
      kernelParams = [
        "video=DP-1:1920x1080@60"
        "video=HDMI-A-1:1920x1080@60"
      ];
    };

  };
}
