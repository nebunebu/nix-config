{ lib, config, ... }:

let
  cfg = config.desktop.browsers.chromium;
in
{
  options.desktop.browsers.chromium = {
    enable = lib.mkEnableOption "enable chromium";
  };

  config = lib.mkIf cfg.enable {
    programs.chromium = {
      enable = true;
      # commandLineArgs = [];
      # dictionaries = [];
      extensions = [
        { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # vimium
        { id = "ofpnikijgfhlmmjlpkfaifhhdonchhoi"; } # accept all cookies
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublockorigin
        { id = "dneaehbmnbhcippjikoajpoabadpodje"; } # old reddit redirect
        { id = "kbmfpngjjgdllneeigpgjifpgocmfgmb"; } # reddit enchancement suite
        { id = "kfghpdldaipanmkhfpdcjglncmilendn"; } # get rss feed url
        # add firenvim
        # add omni
        # add taper monkey
      ];
    };
  };
}
