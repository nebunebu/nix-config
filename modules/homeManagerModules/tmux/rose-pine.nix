{ pkgs
, tmuxPlugins
, ...
}:
tmuxPlugins.mkTmuxPlugin {
  pluginName = "rose-pine";
  version = "unstable-2024-01-07";
  src = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "tmux";
    rev = "dd6d01338ac4afeb96542dcf24e4a7fe179b69e6";
    sha256 = "sha256-Tccb4VjdotOSw7flJV4N0H4557NxRhXiCecZBPU9ICQ=";
  };
  rtpFilePath = "rose-pine.tmux";
}
