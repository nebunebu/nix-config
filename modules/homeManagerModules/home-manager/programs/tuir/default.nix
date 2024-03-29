{ pkgs
, config
, ...
}: {
  home.file = {
    ".config/tuir/tuir.cfg.init".source = ./tuir.cfg;
    ".config/tuir/mailcap".source = ./mailcap;
  };
  home.packages = with pkgs; [
    tuir
  ];

  home.sessionVariables = {
    TUIR_EDITOR = "nvim";
    TUIR_BROWSER = "firefox";
    TUIR_URLVIEWER = "test";
  };

  systemd.user.services.tuir-init = {
    Install.WantedBy = [ "default.target" ];
    Service = {
      Type = "simple";
      ExecStart = with config.xdg; "${pkgs.writeShellScript "tuir-cat" ''
        #!/run/current-system/sw/bin/bash
        ${pkgs.coreutils}/bin/cat ${configHome}/tuir/tuir.cfg.init ${configHome}/tuir/tuir.secrets > ${configHome}/tuir/tuir.cfg
        ${pkgs.coreutils}/bin/rm ${configHome}/tuir/tuir.cfg.init ${configHome}/tuir/tuir.secrets
      ''}";
    };
  };
}
