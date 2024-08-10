{
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "US/Eastern";
  services = {
    openssh.enable = true;
    xserver = {
      xkb = {
        layout = "us";
        options = "caps:swapescape";
      };
    };
  };
  console = {
    useXkbConfig = true;
    font = "Lat2-Terminus16";
    # keyMap = "us";
  };
}
