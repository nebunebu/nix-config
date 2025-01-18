{ pkgs, checks }:

pkgs.mkShell {
  name = "nix-config";
  packages = [
    pkgs.convco
    pkgs.nixfmt-rfc-style
    pkgs.deadnix
    pkgs.statix
  ];
  shellHook =
    let
      cowWarn = pkgs.writeShellApplication {
        name = "cowWarn";
        runtimeInputs = [ pkgs.cowsay ];
        text = ''
          if [ "$(git branch --show-current)" = "main" ]; then
              echo -e "\033[1;35m$(cowsay -f tux 'Hey! You are on main. Before making changes, git pull and make a new branch.')\033[0m"
            fi
        '';
      };
    in
    ''
      ${cowWarn}/bin/cowWarn
    '';
  # inherit (checks.pre-commit-check) shellHook;
  # buildInputs = checks.pre-commit-check.enabledPackages;
}
