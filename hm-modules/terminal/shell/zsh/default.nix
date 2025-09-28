{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.neb.terminal.shell.zsh;
in
{
  imports = [
    ./completions
    ./secrets.nix
  ];

  options = {
    neb.terminal.shell.zsh.enable = lib.mkEnableOption "enable zsh";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        zprof.enable = false;
        enableVteIntegration = true;
        localVariables.CLIPBOARD = "wlp";
        history.path = "${config.xdg.configHome}/zsh/zsh_history";
        sessionVariables = {
          FUNCNEST = 100000;
          EDITOR = "nvim";
        };

        shellAliases = {
          nt = "nix run ${config.home.homeDirectory}/.nebvim"; # nebvim test
          svim = "sudo -Es nvim";
          grep = "grep --color=\"auto\"";
          ip = "ip --color=\"auto\"";
          diff = "diff --color=\"auto\"";
          tree = "eza --tree";
          cat = "bat";
        };

        completionInit = ''
          # Add aichat completion to fpath
          fpath+=${
            pkgs.fetchFromGitHub {
              owner = "sigoden";
              repo = "aichat";
              rev = "v0.26.0";
              sha256 = "sha256-02v4nnQTKkX7ssZ2it7YfDtx6w/vVWG5crMhwdv3tmM=";
              sparseCheckout = [ "scripts/completions" ];
            }
          }/scripts/completions
        '';

        initContent = # bash
          ''
            function nfd() {
              nvim $(fd "$1" | fzf)
            }

            # Function to kill processes using fzf
            function fzf-kill-process() {
              local pid
              pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

              if [ "x$pid" != "x" ]; then
                echo $pid | xargs kill -9
              fi
              zle reset-prompt
            }
            zle -N fzf-kill-process

            function zvm_after_lazy_keybindings() {
              zvm_bindkey vicmd '^r' fzf-history-widget
              zvm_bindkey viins '^r' fzf-history-widget
              zvm_bindkey vicmd '^x' fzf-kill-process
              zvm_bindkey viins '^x' fzf-kill-process
              zvm_bindkey vicmd ':' undefined-key
            }

            ZVM_CURSOR_STYLE_ENABLED=false  # Disable zsh-vi-mode's cursor shape control
          '';

        plugins = [
          {
            name = "nix-zsh-completions";
            src = pkgs.fetchFromGitHub {
              owner = "nix-community";
              repo = "nix-zsh-completions";
              rev = "a7c8781b5a18026fbc3edb36397931526f243590";
              hash = "sha256-JStpIKU+jU6TkXToTONfdEhLjaASGzC+tRmSJRiqKWU=";
            };
          }
          {
            name = "zsh-autopair";
            src = pkgs.fetchFromGitHub {
              owner = "hlissner";
              repo = "zsh-autopair";
              rev = "v1.0";
              sha256 = "wd/6x2p5QOSFqWYgQ1BTYBUGNR06Pr2viGjV/JqoG8A=";
            };
          }
          {
            name = "fzf-tab";
            src = pkgs.fetchFromGitHub {
              owner = "Aloxaf";
              repo = "fzf-tab";
              rev = "HEAD";
              sha256 = "sha256-gvZp8P3quOtcy1Xtt1LAW1cfZ/zCtnAmnWqcwrKel6w=";
            };
          }
          {
            name = "zsh-completions";
            src = pkgs.fetchFromGitHub {
              owner = "zsh-users";
              repo = "zsh-completions";
              rev = "0.35.0";
              sha256 = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
            };
          }
          {
            name = "zsh-syntax-highlighting";
            src = pkgs.fetchFromGitHub {
              owner = "zsh-users";
              repo = "zsh-syntax-highlighting";
              rev = "0.7.1";
              sha256 = "sha256-gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
            };
          }
          {
            name = "zsh-vi-mode";
            src = pkgs.fetchFromGitHub {
              owner = "jeffreytse";
              repo = "zsh-vi-mode";
              rev = "v0.11.0";
              sha256 = "sha256-xbchXJTFWeABTwq6h4KWLh+EvydDrDzcY9AQVK65RS8=";
            };
          }
        ];
      };
    };
  };
}
