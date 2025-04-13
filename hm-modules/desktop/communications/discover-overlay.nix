{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.communications.discover-overlay;
in
{
  options.neb.desktop.communications.discover-overlay = {
    enable = lib.mkEnableOption "enable discover-overlay";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.discover-overlay ];
    # NOTE: toggle reserved workspace
    # hyprctl keyword monitor HDMI-A-1,addreserved,0,0,165,0
    # hyprctl keyword monitor HDMI-A-1,addreserved,0,0,0,0
  };
}

# NOTE: t5610
# ~/.config/discover_overlay/config.ini
# may need to dynamically get access token
# [cache]
#
# [main]
# monitor = HDMI-A-1
# rightalign = 0
# topalign = 0
# tk_col = [0.19215686274509802, 0.45490196078431355, 0.5607843137254902, 1.0]
# fg_hi_col = [0.09803921568627456, 0.09019607843137253, 0.1411764705882353, 1.0]
# hi_col = [0.19215686274509802, 0.45490196078431355, 0.5607843137254902, 1.0]
# show_title = False
# show_connection = False
# vert_edge_padding = 13
# horz_edge_padding = 10
# show_dummy = False
# dummy_count = 50
# show_disconnected = False
# icon_only = False
# text_padding = 9
# text_baseline_adj = 0
# nick_length = 11
# show_avatar = True
# square_avatar = True
# fancy_border = True
# avatar_size = 39
# overflow = 0
# order = 2
# highlight_self = False
# border_width = 1
# icon_spacing = 8
# fade_out_inactive = False
# mt_col = [0.9215686274509803, 0.43529411764705883, 0.5725490196078431, 1.0]
# mt_bg_col = [0.0, 0.0, 0.0, 0.5]
# bg_col = [0.09803921568627454, 0.09019607843137253, 0.1411764705882353, 1.0]
# bo_col = [0.09803921568627456, 0.09019607843137253, 0.1411764705882353, 1.0]
# title_font = Sans Bold 12
#
# [notification]
# enabled = False
# monitor = HDMI-A-1
# rightalign = 0
# topalign = 1
#
# [text]
# monitor = Any
# fg_col = [0.9647058823529412, 0.9607843137254902, 0.9568627450980393, 1.0]
