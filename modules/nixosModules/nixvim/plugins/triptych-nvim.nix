{ pkgs
, vimUtils
, ...
}:
vimUtils.buildVimPlugin {
  pname = "triptych.nvim";
  version = "2023-02-10";
  src = pkgs.fetchFromGitHub {
    owner = "simonmclean";
    repo = "triptych.nvim";
    rev = "7a416c7b7760699d8ffcacac330ff1559cc29a63";
    hash = "sha256-XzKzOcAHO/A6+tQTXPgGDLjXFjUzrvpzvxOGzTtTM+o=";
  };
  meta.homepage = "https://github.com/simonmclean/triptych.nvim";
}
