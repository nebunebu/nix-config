{
  programs.nixvim.autoCmd = [
    {
      event = [ "BufRead" "BufNewFile" ];
      pattern = [ "*.conf" ];
      command = "set filetype=conf";
    }
    {
      event = [ "FileType" ];
      pattern = [ "nix" ];
      command = "inoremap <buffer> = =;<left>";
    }
  ];
}
