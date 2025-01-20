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
    nixpkgs.config.rocmSupport = true;

    environment = {
      systemPackages = with pkgs; [
        clinfo
        glxinfo
        lact
        libdrm
        rocmPackages.rocm-device-libs
        rocmPackages.rocm-runtime
        rocmPackages.rocm-smi
        rocmPackages.rocminfo
      ];
      variables = {
        ROC_ENABLE_PRE_VEGA = "1";
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
          rocmPackages.clr.icd
          rocmPackages.clr
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
