{
  imports = [
    ../../../users/nebu/hm.nix
  ];
}

#   home = {
#     stateVersion = "23.11";
#     packages = [
#       (pkgs.writeShellApplication {
#         name = "roseify";
#         runtimeInputs = [ pkgs.lutgen ];
#         text = # sh
#           ''
#             lutgen apply "$1" -o "roseified-$1" -p rose-pine
#           '';
#       })
#
#       pkgs.drawio
#       pkgs.texlivePackages.latexmk
#       pkgs.libnotify
#     ];
#
#   };
#
# }
