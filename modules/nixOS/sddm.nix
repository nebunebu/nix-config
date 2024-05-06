{
  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      # theme = "${import /path/to/config}";
      # services.xserver.displayManager.sddm.theme = fetchTarball {
      #        url = "https://github.com/AlfredoRamos/urbanlifestyle-sddm-theme/archive/0.4.3.tar.gz";
      #        sha256 = "1l1352in9djzj79mf3lr3w0m7miyg0my0ics7hpizgwqm1l7ppm2";
      #    };
      # theme = "sddm-chili-theme";
    };
  };
}
