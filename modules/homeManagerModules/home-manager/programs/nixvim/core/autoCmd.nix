{
  programs.nixvim.autoCmd = [
    {
      event = [ "BufRead" "BufNewFile" ];
      pattern = [ "*.conf" ];
      command = "set filetype=conf";
    }
  ];
}
