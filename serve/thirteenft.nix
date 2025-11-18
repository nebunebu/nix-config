{
  lib,
  config,
  ...
}:
let
  cfg = config.nos.thirteenft;
in
{
  options.nos.thirteenft = {
    enable = lib.mkEnableOption "enable 13ft";
  };

  config = lib.mkIf cfg.enable {

    virtualisation.oci-containers.containers.thirteenft = {
      image = "wasimaster/13ft:latest";
      autoStart = true;
      ports = [ "127.0.0.1:3001:5000" ];
    };
  };
}
