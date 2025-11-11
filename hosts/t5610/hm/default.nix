{
  inputs,
  ...
}:

{
  imports = [
    "${inputs.self}/hm-modules"
  ];

  home = {
    stateVersion = "23.11";
  };
}
