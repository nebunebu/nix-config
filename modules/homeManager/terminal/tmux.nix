{ pkgs, unstablePkgs, lib, config, ... }:
let
  t = pkgs.tmuxPlugins;
  ut = unstablePkgs.tmuxPlugins;
  palette = config.stylix.base16Scheme.palette;
in

{
  options = {
    app.tmux.enable = lib.mkEnableOption "enable tmux";
  };

  config = lib.mkIf config.app.tmux.enable {
    programs.tmux = {
      enable = true;
      package = unstablePkgs.tmux;
      shell = "${pkgs.zsh}/bin/zsh";
      prefix = "C-SPACE";
      keyMode = "vi";
      baseIndex = 1;
      disableConfirmationPrompt = true;
      mouse = true;
      newSession = true;
      sensibleOnTop = true;
      terminal = "xterm-kitty";
      extraConfig = lib.mkForce
        ''
          set -g allow-passthrough on
          set -ga update-environment TERM
          set -ga update-environment TERM_PROGRAM
          set -g status-position top
          set -g status-interval 1

          set -g status-bg "#${palette.base00}"
          set-option -g pane-active-border-style fg='#${palette.base09}'

          bind r source-file ~/.config/tmux/tmux.conf

          # Open panes in current directory
          bind '"' split-window -v -c "#{pane_current_path}"
          bind % split-window -h -c "#{pane_current_path}"

          bind ' ' display-popup -d "#{pane_current_path}"

          # Ctrl+Alt  vim keys to resize panes
          bind-key -n C-M-k resize-pane -U 5
          bind-key -n C-M-j resize-pane -D 5
          bind-key -n C-M-h resize-pane -L 5
          bind-key -n C-M-l resize-pane -R 5

          # Shift Alt vim keys to switch windows
          bind -n M-H previous-window
          bind -n M-L next-window

          # Smart pane switching with awareness of Vim splits.
          # See: https://github.com/christoomey/vim-tmux-navigator
          is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
              | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"

          bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
          bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
          bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
          bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'

          tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
          if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
          if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

          bind-key -T copy-mode-vi 'C-h' select-pane -L
          bind-key -T copy-mode-vi 'C-j' select-pane -D
          bind-key -T copy-mode-vi 'C-k' select-pane -U
          bind-key -T copy-mode-vi 'C-l' select-pane -R
          bind-key -T copy-mode-vi 'C-\' select-pane -l

          # Keybindings
          bind-key -T copy-mode-vi v send-keys -X begin-selection
          bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
          bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        '';

      plugins = [
        {
          plugin = ut.rose-pine;
          extraConfig = ''
            set -g @rose_pine_variant 'main'
            set -g @rose_pine_date_time '%_I:%M %a %D'
            set -g @rose_pine_show_pane_directory 'on'
            set -g @rose_pine_status_left_prepend_section '#{tmux_mode_indicator} #{continuum_status} '
            set -g @rose_pine_show_current_program 'on'
            set -g @rose_pine_show_pane_directory 'on'
          '';
        }
        {
          plugin = t.resurrect;
          extraConfig = ''
            # set -g @ressurect-strategy-nvim 'session'
            # set -g @resurrect-capture-pane-contents 'on'
          '';
        }
        {
          plugin = t.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '10'
          '';
        }
        {
          plugin = t.mode-indicator;
          extraConfig = ''
            set -g @mode_indicator_prefix_prompt ' WAIT '
            set -g @mode_indicator_copy_prompt ' COPY '
            set -g @mode_indicator_sync_prompt ' SYNC '
            set -g @mode_indicator_empty_prompt ' TMUX '
            set -g @mode_indicator_copy_mode_style 'bg=#${palette.base00},fg=#${palette.base09}'
            set -g @mode_indicator_sync_mode_style 'bg=#${palette.base00},fg=#${palette.base08}'
            set -g @mode_indicator_empty_mode_style 'bg=#${palette.base00},fg=#${palette.base0C}'
          '';
        }
        {
          plugin = t.extrakto;
          extraConfig = ''
            set -g @extrakto_clip_tool wl-copy
            set -g @extrakto_editor nvim
            set -g @extrakto_open_tool firefox
            set -g @extrakto_filter_order 'url path line word'
          '';
        }
        t.sensible
        t.vim-tmux-navigator
        t.yank
      ];
    };
  };
}
