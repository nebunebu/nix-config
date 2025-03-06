{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

# warning: Git tree '/home/nebu/.nix-config' is dirty
# evaluation warning: rustPlatform.fetchCargoTarball is deprecated in favor of rustPlatform.fetchCargoVendor.
#                     If you are using buildRustPackage, try setting useFetchCargoVendor = true and regenerating cargoHash.
#                     See the 25.05 release notes for more information.
# evaluation warning: rustPlatform.fetchCargoTarball is deprecated in favor of rustPlatform.fetchCargoVendor.
#                     If you are using buildRustPackage, try setting useFetchCargoVendor = true and regenerating cargoHash.
#                     See the 25.05 release notes for more information.

rustPlatform.buildRustPackage {
  pname = "crib";
  version = "unstable-2025-03-04";

  src = fetchFromGitHub {
    owner = "noelzubin";
    repo = "crib";
    rev = "5c6bab4dfa00ac3586b5ad393e49e991eed0bcee";
    hash = "sha256-kuNBjkh4saB3plCIPHHoWOJNf8KS3ABfq+RzTUNMX94=";
  };

  cargoHash = "sha256-6Bq4JltNg49Aw0/tQdq3RwmTC7kl5W8vperranubTh4=";

  meta = {
    description = "Create and view custom hotkey cheatsheets in the terminal";
    homepage = "https://github.com/noelzubin/crib";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ nebunebu ];
    mainProgram = "crib";
  };
}
