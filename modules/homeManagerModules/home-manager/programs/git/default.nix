{
  programs.git = {
    enable = true;
    userEmail = "nebu.nebuchadnezzar@gmail.com";
    userName = "nebunebu";
    delta.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
