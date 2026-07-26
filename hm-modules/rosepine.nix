# The rosé pine palette module, exposed as `config.rosePine.*`.
#
# Lives here rather than inside a consuming module because several unrelated
# modules read the palette (tmux, ghostty, wvkbd) and the module may only be
# imported once.
{ inputs, ... }:
{
  imports = [ inputs.rosepine.homeManagerModule.rosePine ];
}
