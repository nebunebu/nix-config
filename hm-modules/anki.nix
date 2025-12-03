{ lib, config, ... }:

{
  programs.anki = {
    enable = true;
    # answerKeys = {};
    language = "en_US";
    # sync = {
    # keyFile = ./path;
    # syncMedia = true;
    # };
    theme = "dark";
    videoDriver = "opengl";
  };
}
