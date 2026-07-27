{ inputs, ... }:
inputs.nixpkgs.legacyPackages
|> inputs.nixpkgs.lib.getAttrs (import ./systems.nix).all
|> builtins.mapAttrs (
  system: pkgs:
  let
    preCommitCheck = import ./pre-commit-hooks.nix { inherit inputs system; };
  in
  {
    default = pkgs.mkShell {
      name = "nix-config";
      packages = [
        pkgs.convco
        pkgs.nixfmt
        pkgs.deadnix
        pkgs.statix
      ]
      ++ preCommitCheck.enabledPackages;

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
          ${preCommitCheck.shellHook}
          ${cowWarn}/bin/cowWarn
        '';
    };
  }
)
