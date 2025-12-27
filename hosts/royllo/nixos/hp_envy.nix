{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true; # CUPS
    };
    avahi.enable = true; # mDNS for driverless discovery
    ipp-usb.enable = true; # exposes the USB printer as IPP/eSCL on localhost:60000

  };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ]; # eSCL/AirScan scanner
    # hpaio (HPLIP) not required for this path
  };

  environment.systemPackages = with pkgs; [
    hplip # optional: CLI tools like hp-info (won’t be used as backend)
    simple-scan # optional GUI scanner
    cups # lp, lpstat tools
  ];

  users.users.acgp.extraGroups = [
    "lp"
    "scanner"
  ];
}
