{ inputs, ... }:
inputs.nixpkgs.legacyPackages
|> builtins.mapAttrs (
  system: pkgs:
  let
    # checks = inputs.self.checks.${system};
  in
  {
    default = pkgs.mkShell {
      name = "nix-config";
      packages = [
        pkgs.convco
        pkgs.nixfmt-rfc-style
        pkgs.deadnix
        # pkgs.statix
      ];

      # buildInputs = checks.pre-commit-check.enabledPackages;

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
    };
  }
)
