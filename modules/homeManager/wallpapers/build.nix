{ stdenv, lib, ... }:
let
  fs = lib.fileset;
  sourceFiles = ./liminal-tv.jpg;
in
fs.trace sourceFiles

  stdenv.mkDerivation
{
  name = "fileset";
  src = fs.toSource {
    root = ./.;
    fileset = sourceFiles;
  };

  postInstall = ''
    mkdir $out
    cp -v liminal-tv.jpg $out
  '';
}
# imports = [
#   ./liminal-hall.jpg
#   ./liminal-room.jpg
#   ./liminal-tv.jpg
# ];
