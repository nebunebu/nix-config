{ pkgs, modulesPath, ... }:

# NOTE: Build with:
# NOTE:   nix run nixpkgs#nixos-generators --\
# NOTE:   --format iso --flake ~/.nix-config#nixISO -o nixISO

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  environment.systemPackages = [
    pkgs.git
    pkgs.ripgrep-all
  ];

  # TODO: isolate into module
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "US/Eastern";
  services = {
    openssh.enable = true;
    xserver = {
      layout = "us";
      xkbOptions = "caps:swapescape";
    };
  };

  console = {
    useXkbConfig = true;
    font = "Lat2-Terminus16";
    # keyMap = "us";
  };
  system.stateVersion = "23.11";
}
