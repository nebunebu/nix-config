{
  imports = [
    ./nebu.nix
    ./acgp.nix
  ];

  # Enable nebu user by default (primary user)
  nos.users.nebu.enable = true;
}
