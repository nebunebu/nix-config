{
  name = "Links";
  hide-desktop-navigation = false;
  center-vertically = true;
  columns = [
    {
      size = "full";
      widgets = [
        {
          type = "bookmarks";
          title = "Games & Puzzles";
          groups = [
            {
              title = "Word";
              color = "197 48 47";
              links = [
                {
                  title = "NYT Games";
                  url = "https://www.nytimes.com/crosswords";
                  same-tab = true;
                }
                {
                  title = "WP Crossword";
                  url = "https://www.washingtonpost.com/crossword-puzzles/daily/";
                  same-tab = true;
                }
                {
                  title = "squardle";
                  url = "https://squardle.app";
                  same-tab = true;
                }
              ];
            }
            {
              title = "Chess";
              color = "248 15 61";
              links = [
                {
                  title = "lichess";
                  url = "https://www.lichess.org";
                  same-tab = true;
                }
                {
                  title = "chesstempo";
                  url = "https://www.chesstempo.com";
                  same-tab = true;
                }
                {
                  title = "chessable";
                  url = "https://www.chessable.com";
                  same-tab = true;
                }
              ];
            }
            {
              title = "Geography";
              color = "197 48 47";
              links = [
                {
                  title = "seterra";
                  url = "https://seterra.com/#quizzes";
                  same-tab = true;
                }
                {
                  title = "travle";
                  url = "https://travle.earth";
                  same-tab = true;
                }
                {
                  title = "chessable";
                  url = "https://www.chessable.com";
                  same-tab = true;
                }
              ];
            }
            {

              title = "Other";
              color = "35 88 72";
              links = [
                {
                  title = "jetpunk";
                  url = "https://jetpunk.com";
                  same-tab = true;
                }
                {
                  title = "sporcle";
                  url = "https://sporcle.com";
                  same-tab = true;
                }
                {
                  title = "puzzgrid.com";
                  url = "https://www.puzzgrid.com";
                  same-tab = true;
                }
              ];
              #                   same-tab: true
              #                 - title: j-archive
              #                   url: https://www.j-archive.com
              #                   same-tab: true
              #                 - title: Jane Street Puzzles
              #                   url: https://www.janestreet.com/puzzles/archive/
              #                   same-tab: true
            }
          ];
        }
      ];
    }
  ];
}

# - name: Links
#   hide-desktop-navigation: false
#   center-vertically: false
#   columns:
#     - size: full
#       widgets:
#         - type: bookmarks
#           title: Games & Puzzles
#             # - title: Math
#             #   color: 343 76 68
#             #   links:
#             #     - title: Jane Street Puzzles
#             #       url: https://www.janestreet.com/puzzles/archive/
#             - title: Coding
#               color: 189 43 73
#               links:
#                 - title: advent of code
#                   url: https://adventofcode.com/2024/events
#                   same-tab: true
#                 - title: leetcode
#                   url: https://www.leetcode.com
#                   same-tab: true
#                 - title: cssbattle
#                   url: https://www.cssbattle.dev
#                   same-tab: true
#                   # - title: floxbox frog
#                   #   url: https://www.flexboxfroggy.com
#                   # - title: css grid garden
#                   #   url: https://www.cssgridgarden.com
#                   # TODO: keybind/vim games
#         - type: bookmarks
#           title: Educational
#           # TODO: add more
#           groups:
#             - title:
#               links:
#                 - title: classcentral
#                   url: https://classcentral.com
#                   same-tab: true
#                 - title: busy-beavers
#                   url: https://busy-beavers.tigyog.app/
#                   same-tab: true
#                 - title: Ocaml Programming
#                   url: https://cs3110.github.io/textbook/cover.html
#                   same-tab: true
#     - size: full
#       widgets:
#         - type: bookmarks
#           title: Docs and Ref
#           groups:
#             - title: Nix
#               links:
#                 - title: NixOS
#                   url: https://nixos.org/manual/nixos/stable/
#                   same-tab: true
#                 - title: Nixpkgs
#                   url: https://nixos.org/manual/nixpkgs/stable/
#                   same-tab: true
#                 - title: Nix
#                   url: https://nix.dev/manual/nix/2.24
#                   same-tab: true
#                 - title: NixOS Wiki
#                   url: https://nixos.wiki/wiki/Main_Page
#                   same-tab: true
#                 - title: nix.dev
#                   url: https://nix.dev
#                   same-tab: true
#                 - title: noogle
#                   url: https://noogle.dev
#                   same-tab: true
#                   # NOTE:
#                   # not much use since just use man and cli
#                   # - title: NixOS options search
#                   #   url: https://search.nixos.org/options?
#                   # - title: Home Manager options search
#                   #   url: https://home-manager-options.extranix.com/
#             - title: Desktop
#               links:
#                 # TODO: consider apps like newsboat, neovim
#                 # condier group for lua, bash, etc, mozzilla docs
#                 - title: Hyprland Wiki 0.45.0
#                   url: https://wiki.hyprland.org/0.45.0
#                   same-tab: true
#                 - title: Pyprland Web
#                   url: https://hyprland-community.github.io/pyprland/
#                   same-tab: true
#                 - title: stylix
#                   url: https://stylix.danth.me/
#                   same-tab: true
#             - title: Other
#               links:
#                 - title: ArchWiki
#                   url: https://wiki.archlinux.org/title/Main_page
#                   same-tab: true
#         - type: bookmarks
#           title: Frontend
#           groups:
#             - title: Fonts
#               links:
#                 - title: google fonts
#                   url: https://fonts.google.com
#                   same-tab: true
#             - title: Colors
#               links:
#                 - title: rose-pine
#                   url: https://rosepinetheme.com/palette/ingredients/
#                   same-tab: true
#                   # - title: local stylix palette
#                   #   url: file:///etc/stylix/palette.html
#                   #   same-tab: true
#             - title: Icons
#               links:
#                 - title: Simple Icons
#                   url: https://simpleicons.org
#                   same-tab: true
#                 - title: Nerd Font
#                   url: https://nerdfonts.com/cheat-sheet
#                   same-tab: true
