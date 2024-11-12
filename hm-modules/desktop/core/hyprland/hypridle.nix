{
  services.hypridle = {
    enable = true;
    settings = {
      general = {

        before_sleep_cmd = "notify-send \"Zzz\"";
        after_sleep_cmd = "notify-send \"Awake!\"";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };
      listener = [
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        # {
        # timeout = 1200;
        # on-time
        # }
      ];
    };
  };
}
