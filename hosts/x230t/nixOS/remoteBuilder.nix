{
  nix = {
    distributedBuilds = true;
    buildMachines = [{
      hostName = "t5610";
      system = "x86_64-linux";
      protocol = "ssh-ng";
      sshKey = "/root/.ssh/builder_key";
      sshUser = "builder";
      publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUJ3QmY1ZjNOMndaTHgzbkRzbDVFVVZSdUxpWUpwVWVOYXNPV0p6bXltanIK";
      maxJobs = 4;
      speedFactor = 6;
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
