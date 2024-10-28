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
    environment = {
      systemPackages = [ pkgs.lact ];
      ROC_ENABLE_PRE_VEGA = "1";
    };

    systemd = {
      packages = [ pkgs.lact ];
      services.lactd.wantedBy = [ "multi-user.target" ];
    };

    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
        extraPackages = [ pkgs.rocmPackages.clr.icd pkgs.amdvlk ];
        extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
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
