{ pkgs, ... }:
{
  # enable SANE scanner support
  hardware.sane.enable = true;

  environment.systemPackages = with pkgs; [
    sane-backends # core scanner backends
    sane-airscan # eSCL / WSD support (Brother uses this)
    simple-scan # easy GUI frontend
  ];
}
