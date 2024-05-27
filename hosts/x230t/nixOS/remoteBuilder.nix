{
  nix = {
    distributedBuilds = true;
    buildMachines = [{
      hostName = "t5610";
      system = "x86_64-linux";
      protocol = "ssh-ng";
      # publicHostKey = "hostkey";
      maxJobs = 4194304;
      speedFactor = 6;
      # sshKey = "/path/to/sshkey";
      supportedFeatures = [
        "nixos-test"
        "benchmark"
        "big-parallel"
        "kvm"
      ];
    }];

    extraOptions = ''
      builders-use-substitutes = true
    '';
  };
}
