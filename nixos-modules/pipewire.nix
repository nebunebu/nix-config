{ lib
, config
, ...
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
