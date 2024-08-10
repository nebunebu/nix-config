{
  imports = [ ../../../modules/homeManager ];

  desktop = {
    kitty.enable = true;
  };

  terminal = {
    tmux.enable = true;
  };

  development = {
    git.enable = true;
  };
}
