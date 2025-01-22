{ lib
, config
, ...
}:
let
  cfg = config.neb.terminal.media.newsboat;
in
{
  options = {
    neb.terminal.media.newsboat.enable = lib.mkEnableOption "enable newsboat";
  };

  config = lib.mkIf cfg.enable {
    programs.newsboat = {
      enable = true;
      extraConfig = /* gitconfig */ ''
        urls-source "freshrss"
        freshrss-url "http://192.168.1.177/api/greader.php"
        freshrss-login "admin"
        freshrss-flag-star "b"
        freshrss-passwordfile "~/.freshrss_key"

        bind-key j down
        bind-key k up
        bind-key J next-feed articlelist
        bind-key K prev-feed articlelist
        bind-key G end
        bind-key g home
        bind-key d pagedown
        bind-key u pageup
        bind-key l open
        bind-key h quit
        bind-key a toggle-article-read
        bind-key n next-unread
        bind-key N prev-unread
        bind-key U show-urls

        # Base interface colors
        color listfocus           color5    color10
        color listfocus_unread    color5    color10    bold

        color background          default   default
        color listnormal          color8    default
        color listnormal_unread   color4    default   bold
        color info                color0    color0    bold
        color title               color0    color2    bold
        color hint-key            color3    color0    bold
        color hint-keys-delimiter color7    color0
        color hint-separator      color0    color0    bold
        color hint-description    color7    color0
        color article             color7    default

        # Article highlighting
        # highlight all "---.*---" color5
        # highlight feedlist ".*(0/0))" color8
        # highlight article "(^Feed:.*|^Title:.*|^Author:.*)" color6 default bold
        # highlight article "(^Link:.*|^Date:.*)" color7 default
        # highlight article "https?://[^ ]+" color4 default
        # highlight article "^(Title):.*$" color5 default
        # highlight article "\\[[0-9][0-9]*\\]" color6 default bold
        # highlight article "\\[image\\ [0-9]+\\]" color4 default bold
        # highlight article "\\[embedded flash: [0-9][0-9]*\\]" color4 default bold
        # highlight article ":.*\\(link\\)$" color6 default
        # highlight article ":.*\\(image\\)$" color5 default
        # highlight article ":.*\\(embedded flash\\)$" color6 default
      ''
      ;
    };
  };
}
