{
  inputs,
  system,
}:
inputs.pre-commit-hooks.lib.${system}.run {
  src = ../.;
  hooks = {
    treefmt = {
      enable = true;
      package = inputs.self.formatter.${system};
    };
    # convco.enable = false;
  };
}
