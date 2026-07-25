{ lib, ... }:
{
  # DMS owns settings.json at runtime (theme picker, bar layout editor, wallpaper
  # picker, etc. all write back to it). Managing it via
  # `programs.dank-material-shell.settings` would turn it into a read-only symlink
  # into the Nix store and get clobbered on every switch, so instead we seed it once
  # from the last known-good live config and never touch it again afterward.
  config.home.activation.dmsSettingsSeed = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target="$HOME/.config/DankMaterialShell/settings.json"
    backup="$HOME/.config/DankMaterialShell.bak.2/settings.json.backup"
    if [[ ! -e "$target" && -e "$backup" ]]; then
      run mkdir -p $VERBOSE_ARG "$HOME/.config/DankMaterialShell"
      run cp $VERBOSE_ARG "$backup" "$target"
    fi
  '';

  # session.json (light/dark mode, per-monitor wallpaper) had the same read-only
  # xdg.stateFile clobbering problem; seed it once from its own backup too.
  config.home.activation.dmsSessionSeed = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target="$HOME/.local/state/DankMaterialShell/session.json"
    backup="$HOME/.local/state/DankMaterialShell/session.json.backup"
    if [[ ! -e "$target" && -e "$backup" ]]; then
      run mkdir -p $VERBOSE_ARG "$HOME/.local/state/DankMaterialShell"
      run cp $VERBOSE_ARG "$backup" "$target"
    fi
  '';
}
