{
  programs.nixvim.options = {
    autochdir = true;
    clipboard = "unnamedplus";
    number = true;
    relativenumber = true;
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    smarttab = true;
    autoindent = true;
    linebreak = true;
    hidden = true;
    cindent = true;
    undofile = true;
    swapfile = false;
    ignorecase = true;
    smartcase = true;
    incsearch = true;
    fillchars = { eob = " "; };
  };
}
