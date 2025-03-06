[
  {
    name = "tmux";
    bindings = [
      {
        name = "leader";
        key = "CTRL+SPACE";
      }
    ];
    children = [
      {
        name = "Session Management";
        bindings = [
          {
            name = "rename session";
            key = "<leader>$";
          }
          {
            name = "open session tree";
            key = "<leader>s";
          }
          {
            name = "previous session";
            key = "<leader>(";
          }
          {
            name = "next session";
            key = "<leader>)";
          }
          {
            name = "last session";
            key = "<leader>L";
          }
          {
            name = "detatch from session";
            key = "<leader>d";
          }
          {
            name = "new session";
            key = "<leader>:new";
          }
        ];
      }
      {
        name = "Miscellaneous Commands";
        bindings = [
          {
            name = "toggle popup";
            key = "<leader>SPACE";
          }
          {
            name = "list bindings";
            key = "<leader>?";
          }
          {
            name = "show window info";
            key = "<leader>i";
          }
          {
            name = "show time";
            key = "<leader>t";
          }
          {
            name = "show messages";
            key = "<leader>`";
          }
        ];
      }
      {
        name = "panes";
        bindings = [
          {
            name = "split vertical";
            key = "<leader>%";
          }
          {
            name = "split horizontal";
            key = "<leader>\"";
          }
          {
            name = "move current pane left";
            key = "<leader>{";
          }
          {
            name = "move current pane left";
            key = "<leader>}";
          }
          {
            name = "toggle pane zoom";
            key = "<leader>z";
          }
          {
            name = "toggle pane layout";
            key = "<leader>space";
          }
          {
            name = "convert pane into a window";
            key = "<leader>!";
          }
        ];
      }
    ];
  }
]
