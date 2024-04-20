{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = {
      fg = "#908caa";
      "fg+" = "#e0def4";
      bg = "#1f1d2e";
      "bg+" = "#26233a";
      hl = "#ebbcba";
      "hl+" = "#31748f";
      info = "#f6c177";
      prompt = "#31748f";
      pointer = "#31748f";
      marker = "#ebbcba";
      spinner = "#31748f";
      header = "#c4a7e7";
      border = "#26233a";
    };
    tmux = {
      enableShellIntegration = true;
    };
  };
}
