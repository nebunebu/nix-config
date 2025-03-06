[
  {
    name = "neovim";
    bindings = [
      {
        name = "one";
        key = "shift + c";
      }
    ];
    children = [
      {
        name = "surround";
        bindings = [
          {
            name = "surround word with quotes";
            key = "ysiw\"";
          }
          {
            name = "make to end of line string";
            key = "ys$\"";
          }
          {
            name = "delete surrounding bracket";
            key = "ds]";
          }
          {
            name = "delete surrounding tags";
            key = "dst";
          }
          {
            name = "change single quotes to double quotes";
            key = "cs'\"";
          }
          {
            name = "change surrounding tags to <h1>";
            key = "csth1<CR>";
          }
          {
            name = "delete function calls";
            key = "dsf";
          }
        ];
      }
    ];
  }
]
