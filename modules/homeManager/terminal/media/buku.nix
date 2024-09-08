{ pkgs, ... }:

{
  home = {
    packages = [ pkgs.buku ];

    sessionVariables = {
      BUKU_COLORS = "MCexm";
    };
  };
}
