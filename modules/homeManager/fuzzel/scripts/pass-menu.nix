{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "pass-menu" ''
      CHOSEN=$(find ~/.password-store -type f | sed '/\.git/d' | sed '/\.gpg-id/d' | sed 's/\.gpg//' | sed 's/\/home\/nebu\/.password-store\///' | fuzzel -d -w 125)
    '')
  ];
}
