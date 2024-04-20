{ pkgs, lib, ... }: {

  environment.systemPackages = [ pkgs.dotool ];

  users.groups = {
    input = { };
  };

  users.users.nebu = {
    isNormalUser = true;
    extraGroups = [ "input" "uinput" ];
  };

  # makes dotool work
  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
  '';

  home-manager.users.nebu = {
    systemd.user.services.dotoold = {
      Unit = {
        Description = "dotool - uinput tool";
        Documentation = "https://git.sr.ht/~geb/dotool/tree/HEAD/doc/dotool.1.scd";
      };
      Service = {
        Environment = [
          "PATH=$PATH:${
          lib.makeBinPath [
            pkgs.coreutils
            pkgs.procps
          ]
        }"
        ];
        ExecStart = "${pkgs.dotool}/bin/dotoold";
        Restart = "always";
        RestartSec = 10;
      };
      Install = { WantedBy = [ "default.target" ]; };
    };
  };
}
