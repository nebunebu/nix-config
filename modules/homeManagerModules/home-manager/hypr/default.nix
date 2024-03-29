{ pkgs, inputs, ... }:

{
  imports = [
    ./settings
    ./pyprland
    # ./plugins
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "-all" ];
    };
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
    wl-clipboard
    wf-recorder
    grim
    slurp
    wev
  ];
}
