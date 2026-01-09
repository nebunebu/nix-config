{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.hm.sioyek;
  sioyekScripts = pkgs.python3Packages.buildPythonPackage {
    pname = "sioyek-scripts";
    version = "0.0.0";
    src = ./.;
    format = "other";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/${pkgs.python3.sitePackages}/sioyek
      cp ${./dual_panelify.py} $out/${pkgs.python3.sitePackages}/sioyek/dual_panelify.py
      cp ${./extract_highlights.py} $out/${pkgs.python3.sitePackages}/sioyek/extract_highlights.py
      cp ${./sioyek.py} $out/${pkgs.python3.sitePackages}/sioyek/sioyek.py
      touch $out/${pkgs.python3.sitePackages}/sioyek/__init__.py
    '';
    propagatedBuildInputs = with pkgs.python3Packages; [
      numpy
      pymupdf
      pypdf2
      pyqt5
      regex
    ];
  };
  pythonEnv = pkgs.python3.withPackages (_ps: [
    sioyekScripts
  ]);
in
{
  options = {
    hm.sioyek.enable = lib.mkEnableOption "enable sioyek";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.pdftk
      pkgs.python3
    ];
    programs.sioyek = {
      enable = true;
      bindings = {
        "move_up" = "k";
        "move_down" = "j";
        "move_left" = "h";
        "move_right" = "l";

        "new_window" = "<C-t>";
      };
      config = {
        "default_dark_mode" = "0";
        "dark_mode_background_color" = "#191724";
        "background_color" = "#1f1d2e";
        "debug" = "1";

        "new_command _dual_panelify" = ''
          ${pythonEnv}/bin/python -m sioyek.dual_panelify "%{sioyek_path}" "%{file_path}"
        '';

        "new_command _extract_highlights" = ''
          ${pythonEnv}/bin/python -m sioyek.extract_highlights "%{sioyek_path}" "%{local_database}" "%{shared_database}" "%{file_path}" %{zoom_level}
        '';
      };
    };
  };
}
