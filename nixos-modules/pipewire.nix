{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.desktop.pipewire;
in
{
  options.neb.desktop.pipewire = {
    enable = lib.mkEnableOption "enable pipewire";
  };

  config = lib.mkIf cfg.enable {
    services = {
      pipewire = {

        extraConfig.pipewire = {
          "context.properties" = {
            "link.max-buffers" = 16;
            "log.level" = 2;
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 1024;
            "default.clock.min-quantum" = 32;
            "default.clock.max-quantum" = 8192;
            "core.daemon" = true;
            "core.name" = "pipewire-0";
          };
        };

        wireplumber.enable = true;

        enable = true;
        audio.enable = true;
        pulse.enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        jack.enable = true;
      };
    };
  };
}
