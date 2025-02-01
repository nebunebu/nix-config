{
  pkgs,
  lib,
  config,
  ...
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
      systemPackages = with pkgs; [
        clinfo
        glxinfo
        lact
        libdrm
      ];
      variables = {
        GPU_MAX_HEAP_SIZE = "100%";
        GPU_USE_SYNC_OBJECTS = "1";
        HSA_ENABLE_SDMA = "0";
      };
    };

    systemd = {
      packages = [ pkgs.lact ];
      services.lactd.wantedBy = [ "multi-user.target" ];
    };

    hardware = {
      amdgpu = {
        amdvlk.enable = true;
        opencl.enable = true;
        initrd.enable = true;
      };
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          amdvlk
          vulkan-loader
          vulkan-validation-layers
          libva
          libva-utils
          vaapiVdpau
          libvdpau-va-gl
        ];
        extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
      };
    };

    boot = {
      kernelParams = [
        "amdgpu.ppfeaturemask=0xffffffff"
        "amdgpu.dc=1"
        "amdgpu.gpu_recovery=1"
      ];
      kernelModules = [ "amdgpu" ];
    };
  };
}
