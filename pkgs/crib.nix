{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

# specified: sha256-6Bq4JltNg49Aw0/tQdq3RwmTC7kl5W8vperranubTh4=
#            got:    sha256-kG9nmoDtdCNRfC7epJxgVgtUxXqGVmEl+CI0m5oTVGs=

rustPlatform.buildRustPackage {
  pname = "crib";
  version = "unstable-2025-05-10";

  src = fetchFromGitHub {
    owner = "noelzubin";
    repo = "crib";
    rev = "5c6bab4dfa00ac3586b5ad393e49e991eed0bcee";
    hash = "sha256-kuNBjkh4saB3plCIPHHoWOJNf8KS3ABfq+RzTUNMX94=";
  };

  cargoHash = "sha256-kG9nmoDtdCNRfC7epJxgVgtUxXqGVmEl+CI0m5oTVGs=";

  meta = {
    description = "Create and view custom hotkey cheatsheets in the terminal";
    homepage = "https://github.com/noelzubin/crib";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ nebunebu ];
    mainProgram = "crib";
  };
}
