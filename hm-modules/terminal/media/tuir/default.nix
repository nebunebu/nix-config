{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.media.tuir;
in
{
  options = {
    neb.terminal.media.tuir.enable = lib.mkEnableOption "enable tuir";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ pkgs.tuir ];

      sessionVariables = {
        TUIR_EDITOR = "nvim";
        TUIR_BROWSER = "firefox";
      };
    };

    sops = {
      secrets = {
        tuir_client_id = {
          path = "%r/tuir_client_id.txt";
        };
        tuir_client_secret = {
          path = "%r/tuir_client_secret.txt";
        };
      };
      templates.tuir-config = {
        name = "tuir.cfg";
        path = "${config.xdg.configHome}/tuir/tuir.cfg";
        content = # ini
          ''
            [bindings]
            EXIT = q 
            FORCE_EXIT = Q
            HELP = ? 
            SORT_1 = 1
            SORT_2 = 2
            SORT_3 = 3
            SORT_4 = 4
            SORT_5 = 5
            SORT_6 = 6
            SORT_7 = 7
            MOVE_UP = k, <KEY_UP>
            MOVE_DOWN = j, <KEY_DOWN>
            PREVIOUS_THEME = <KEY_F2>
            NEXT_THEME = <KEY_F3>
            PAGE_UP = m, <KEY_PPAGE>, <NAK>
            PAGE_DOWN = n, <KEY_NPAGE>, <EOT>
            PAGE_TOP = gg
            PAGE_BOTTOM = G
            UPVOTE = a
            DOWNVOTE = z
            LOGIN = u
            DELETE = d
            EDIT = e
            INBOX = i
            REFRESH = r, <KEY_F5>
            PROMPT = /
            SAVE = w
            COPY_PERMALINK = y
            COPY_URL = Y
            PRIVATE_MESSAGE = C
            SUBSCRIPTIONS = s
            MULTIREDDITS = S

            ; Submission page
            SUBMISSION_TOGGLE_COMMENT = 0x20
            SUBMISSION_OPEN_IN_BROWSER = o, <LF>, <KEY_ENTER>
            SUBMISSION_POST = c
            SUBMISSION_EXIT = h, <KEY_LEFT>
            SUBMISSION_OPEN_IN_PAGER = l, <KEY_RIGHT>
            SUBMISSION_OPEN_IN_URLVIEWER = b
            SUBMISSION_GOTO_PARENT = K
            SUBMISSION_GOTO_SIBLING = J

            ; Subreddit page
            SUBREDDIT_SEARCH = f
            SUBREDDIT_POST = c
            SUBREDDIT_OPEN = l, <KEY_RIGHT>
            SUBREDDIT_OPEN_IN_BROWSER = o, <LF>, <KEY_ENTER>
            SUBREDDIT_FRONTPAGE = p
            SUBREDDIT_HIDE = 0x20

            ; Subscription page
            SUBSCRIPTION_SELECT = l, <LF>, <KEY_ENTER>, <KEY_RIGHT>
            SUBSCRIPTION_EXIT = h, s, S, <ESC>, <KEY_LEFT>

            ; Inbox page
            INBOX_VIEW_CONTEXT = l, <KEY_RIGHT>
            INBOX_OPEN_SUBMISSION = o, <LF>, <KEY_ENTER>
            INBOX_REPLY = c
            INBOX_MARK_READ = w
            INBOX_EXIT = h, <ESC>, <KEY_LEFT>

            [tuir]
            ascii = False
            monochrome = False
            clipboard_cmd = wl-copy
            flash = False
            log = /tmp/tuir.log
            subreddit = front
            persistent = True
            autologin = False
            clear_auth = False
            history_size = 200
            enable_media = True
            max_comment_cols = 120
            hide_username = False
            look_and_feel = default
            force_new_browser_window = True
            oauth_redirect_uri = http://127.0.0.1:65000
            oauth_redirect_port = 65000
            oauth_scope = edit,history,identity,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote
            ;  NOTE: For login, go to `https://www.reddit.com/prefs/apps/`,
            ;  NOTE: Create app as `web app` with `redirect uri` as `http://127.0.0.1:65000`
            oauth_client_id = ${config.sops.placeholder.tuir_client_id}
            oauth_client_secret = ${config.sops.placeholder.tuir_client_secret}
          '';
        mode = "0400";
      };
    };
  };
}
