{ pkgs, inputs, lib, config, ... }:

{
  # imports = [ inputs.hyprland.homeManagerModules.default ];

  options = {
    desktop.hyprland.enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf config.desktop.hyprland.enable
    {
      wayland.windowManager.hyprland = {
        # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
        enable = true;
        xwayland.enable = true;
        # systemd = {
        #   enable = true;
        #   variables = [ "-all" ];
        # };
      };

      home.packages = with pkgs; [
        wl-clipboard
        wf-recorder
        grim
        slurp
        wev
      ];
    };



  # imports = [
  #   ./settings
  #   ./pyprland
  #   ./plugins
  # ];
  #
}
