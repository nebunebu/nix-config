{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.television;
in
{
  options.neb.terminal.utilities.television = {
    enable = lib.mkEnableOption "enable television";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [
        pkgs.television
        pkgs.nix-search-tv
      ];
      sessionVariables = {
        BAT_THEME = "base16-stylix";
      };
    };

    xdg.configFile."television/default_channels.toml".text = builtins.readFile ./default_channels.toml;
    xdg.configFile."television/themes/rosepine.toml".text = # toml
      let
        inherit (config.rosePine.main)
          base
          text
          gold
          subtle
          pine
          foam
          iris
          overlay
          ;
      in
      ''
        # general
        background = '#${base}'
        border_fg = '#${overlay}'
        text_fg = '#${text}'
        dimmed_text_fg = '#${subtle}'
        # input
        input_text_fg = '#${pine}'
        result_count_fg = '#${pine}'
        # results
        result_name_fg = '#${iris}'
        result_line_number_fg = '#${gold}'
        result_value_fg = '#${iris}'
        selection_fg = '#${pine}'
        selection_bg = '#${overlay}'
        match_fg = '#${pine}'
        # preview
        preview_title_fg = '#${iris}'
        # modes
        channel_mode_fg = '#${pine}'
        remote_control_mode_fg = '#${pine}'
        send_to_channel_mode_fg = '#${foam}'
      '';
    xdg.configFile."television/config.toml".text = # toml
      ''
        tick_rate = 50
        [ui]
        use_nerd_font_icons = true
        ui_scale = 100
        show_help_bar = true
        show_preview_panel = true
        input_bar_position = "top"
        theme = "rosepine"

        [previewers.file]
        # Note that setting the BAT_THEME environment variable will override this setting.
        theme = "TwoDark"

        [keybindings.Channel]
        quit = ["esc", "ctrl-c"]
        select_next_entry = ["down", "ctrl-n", "ctrl-j"]
        select_prev_entry = ["up", "ctrl-p", "ctrl-k"]
        select_next_page = "pagedown"
        select_prev_page = "pageup"
        scroll_preview_half_page_down = "ctrl-d"
        scroll_preview_half_page_up = "ctrl-u"
        toggle_selection_down = "tab"
        toggle_selection_up = "backtab"
        confirm_selection = "enter"
        copy_entry_to_clipboard = "ctrl-y"
        toggle_remote_control = "ctrl-r"
        toggle_send_to_channel = "ctrl-s"
        toggle_help = "ctrl-g"
        toggle_preview = "ctrl-o"

        [keybindings.RemoteControl]
        quit = "esc"
        select_next_entry = ["down", "ctrl-n", "ctrl-j"]
        select_prev_entry = ["up", "ctrl-p", "ctrl-k"]
        select_next_page = "pagedown"
        select_prev_page = "pageup"
        select_entry = "enter"
        toggle_remote_control = "ctrl-r"
        toggle_help = "ctrl-g"
        toggle_preview = "ctrl-o"

        [keybindings.SendToChannel]
        quit = "esc"
        select_next_entry = ["down", "ctrl-n", "ctrl-j"]
        select_prev_entry = ["up", "ctrl-p", "ctrl-k"]
        select_next_page = "pagedown"
        select_prev_page = "pageup"
        select_entry = "enter"
        toggle_send_to_channel = "ctrl-s"
        toggle_help = "ctrl-g"
        toggle_preview = "ctrl-o"


        [shell_integration.commands]
        # Add your commands here. Each key is a command that will trigger tv with the
        # corresponding channel as value.
        # Example: say you want the following prompts to trigger the following channels
        # when pressing <CTRL-T>:
        #          `git checkout` should trigger the `git-branches` channel
        #          `ls`           should trigger the `dirs` channel
        #          `cat`          should trigger the `files` channel
        #
        # You would add the following to your configuration file:
        # ```
        # [shell_integration.commands]
        # "git checkout" = "git-branch"
        # "ls" = "dirs"
        # "cat" = "files"
        # ```

        # environment variables
        "export" = "env"
        "unset" = "env"

        # dirs channel
        "cd" = "dirs"
        "ls" = "dirs"
        "rmdir" = "dirs"

        # files channel
        "cat" = "files"
        "less" = "files"
        "head" = "files"
        "tail" = "files"
        "vim" = "files"
        "bat" = "files"

        # git-diff channel
        "git add" = "git-diff"

        # git-branch channel
        "git checkout" = "git-branch"
        "git branch -d" = "git-branch"

        # docker-images channel
        "docker run" = "docker-images"

        # gitrepos channel
        "nvim" = "git-repos"

        [shell_integration.keybindings]
        # controls which key binding should trigger tv
        # for shell autocomplete
        "smart_autocomplete" = "ctrl-t"
        # controls which keybinding should trigger tv
        # for command history
        "command_history" = "ctrl-r"
      '';
  };
}
