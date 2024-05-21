{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixOS
    inputs.home-manager.nixosModules.default
    # inputs.niri.nixosModules.niri
  ];

  # services = {
  #   pipewire = {
  #     enable = true;
  #     wireplumber.enable = true;
  #     audio.enable = true;
  #     pulse.enable = true;
  #     alsa = {
  #       enable = true;
  #       support32Bit = true;
  #     };
  #     jack.enable = true;
  #   };
  # };

  desktop.hyprland.enable = true;
  # programs.hyprland = {
  #   enable = true;
  # };

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
