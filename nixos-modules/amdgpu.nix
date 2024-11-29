{ pkgs
, unstablePkgs
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
      systemPackages = [ pkgs.lact pkgs.glxinfo ];
      variables = {
        ROC_ENABLE_PRE_VEGA = "1";
        # WLR_DRM_NO_ATOMIC = "1";
        # GDM_BACKEND = "amdgpu";
      };
    };

    systemd = {
      packages = [ pkgs.lact ];
      services.lactd.wantedBy = [ "multi-user.target" ];
    };

    hardware = {
      graphics = {
        enable = true;
        package = unstablePkgs.mesa.drivers;
        extraPackages = [
          # unstablePkgs.mesa.drivers
          pkgs.rocmPackages.clr.icd
          pkgs.amdvlk
          # pkgs.libva
          # pkgs.libva-utils
          # pkgs.vaaiVdpau
          # pkgs.libvdpau-va-gl
        ];
        extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
      };
    };

    # boot = {
    #   kernelParams = [
    #     "amdgpu.ppfeaturemask=0xffffffff" # Enable all powerplay features
    #     "amdgpu.dc=1" # Enable display core
    #   ];
    # };

  };
}
