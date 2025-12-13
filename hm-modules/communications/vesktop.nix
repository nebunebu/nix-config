{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.communications.vesktop;
in
{
  options.hm.communications.vesktop = {
    enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    # home.packages = [ pkgs.vesktop ];
    home.packages = [
      (pkgs.vesktop.overrideAttrs (_: {
        postFixup = lib.optionalString pkgs.stdenv.hostPlatform.isLinux ''
          makeWrapper ${pkgs.electron}/bin/electron $out/bin/vesktop \
            --add-flags $out/opt/Vesktop/resources/app.asar \
            --add-flags "--disable-gpu" \
            --add-flags "--disable-gpu-compositing" \
            --add-flags "--disable-software-rasterizer" \
            ${lib.strings.optionalString pkgs.withTTS ''
              --run 'if [[ "''${NIXOS_SPEECH:-default}" != "False" ]]; then NIXOS_SPEECH=True; else unset NIXOS_SPEECH; fi' \
              --add-flags "\''${NIXOS_SPEECH:+--enable-speech-dispatcher}" \
            ''} \
            ${lib.optionalString pkgs.withMiddleClickScroll "--add-flags \"--enable-blink-features=MiddleClickAutoscroll\""} \
            --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}"
        '';
      }))
    ];
  };
}
