{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixOS
    inputs.home-manager.nixosModules.default
  ];

  nix = {
    buildMachines = [{
      hostName = "t5610";
      system = "x86_64-linux";
      protocol = "ssh-ng";
      maxJobs = 3;
      speedFactor = 2;
      supportedFeatures = [
        "nixos-test"
        "benchmark"
        "big-parallel"
        "kvm"
      ];
    }];

    distributedBuilds = true;
    extraOptions = ''
      builders-use-substitutes = true
    '';
  };

  programs.ssh.knownHosts = {
    t5610 = {
      hostNames = [ "t5610" ];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBwBf5f3N2wZLx3nDsl5EUVRuLiYJpUeNasOWJzmymjr";
    };
  };

  desktop.hyprland.enable = true;

  networking.hostName = "x230t";
  environment = {
    sessionVariables = {
      HOSTNAME = "x230t";
    };
    etc."machine-id" = {
      text = "78565725a9e64e86b54c846719ef1aa4";
      mode = "0444";
    };
  };
}
