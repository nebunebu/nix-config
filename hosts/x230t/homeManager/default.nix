{ self, inputs, config, pkgs, ... }:

{
  imports = [
    "${self}/modules/homeManager"
    "${self}/custom/homeManager"
  ];

  home.packages = [
    inputs.swww.packages.x86_64-linux.default
    # (pkgs.callPackage "${self}/custom/pkgs/kebihelp.nix" { })
  ];

  programs.xournalpp = {
    enable = true;
    palette =
      with config.stylix.base16Scheme.palette;
      {
        "Teal" = "${base0C}";
        "D Teal" = "${base0B}";
        "Pink" = "${base0A}";
        "Yellow" = "${base09}";
        "Purple" = "${base0D}";
        "Red" = "${base08}";
        "White" = "${base05}";
        "L Gray" = "${base04}";
        "Gray" = "${base03}";
        "D Gray" = "${base0F}";
        "Black" = "${base00}";
      };
    # palette = /* gpl */ ''
    #   GIMP Palette
    #   Name: Xournal Default Palette
    #   #
    #   156 207 216 Teal
    #   235 111 146 Red
    #   235 188 186 Pink
    #   49 116 143 Green
    #   246 193 119 Yellow
    #   224 222 244 White
    #   196 167 231 Purple
    #   144 140 170 Gray
    #   82 79 103 Dark Gray
    #   25 23 36 Black
    #   38 35 58 Black Alt
    # '';
    pagetemplate = /* ini */ ''
      [myBackgroundName]
      name=Ruled with vertical line, custom colors
      format=lined
      config=f1=0x00ff00,af1=0xff00ff,f2=0xffff00,af2=0x0000ff
    '';
  };

  app = {
    git.enable = true;
    kitty.enable = true;
    sioyek.enable = true;
    tmux.enable = true;
  };

  tablet = {
    wvkbd.enable = true;
  };

  desktop = {
    waybar.x230t.enable = true;
    hyprland = {
      enable = true;
      hyprgrass.enable = true;
      x230t.enable = true;
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    "${inputs.swww.packages.x86_64-linux.default}/bin/swww-daemon --format xrgb"
  ];

  # programs.swww = {
  #   hyprlandIntegration.enable = true;
  #   enable = true;
  #   monitors."LVDS-1".wallpaper =
  #     "../../../modules/homeManager/desktop/wallpapers/liminal-room.jpg";
  #   # "${self}/modules/homeManager/desktop/wallpapers/liminal-room.jpg";
  # };
}
