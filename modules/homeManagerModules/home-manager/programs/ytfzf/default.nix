{ pkgs
, config
, ...
}: {
  home.packages = with pkgs; [
    ytfzf
  ];

  xdg.configFile."ytfzf/conf.sh".text =
    /*
      sh
    */
    # NOTE: ytfzf is not using configured mpv instance
    ''
      # detach=1
      video_player="${config.programs.mpv.finalPackage}/bin/mpv"
    '';
}
