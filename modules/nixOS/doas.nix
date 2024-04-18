{
  security.doas.enable = true;
  # security.sudo.enable = false;
  security.doas.extraRules = [{
    users = [ "nebu" ];
    # Optional, retains environment variables while running commands 
    # e.g. retains your NIX_PATH when applying your config
    keepEnv = true;
    persist = true; # Optional, only require password verification a single time
  }];
}
