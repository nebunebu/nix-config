{
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "US/Eastern";
  services = {
    openssh.enable = true;
    xserver = {
      layout = "us";
      xkbOptions = "caps:swapescape";
    };
  };
  console = {
    useXkbConfig = true;
    font = "Lat2-Terminus16";
    # keyMap = "us";
  };
}
