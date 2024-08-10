# NOTE: needs new version of prettytable and qtpy
{
  lib,
  pkgs,
  buildPythonApplication,
  fetchPypi,
  ...
}:

buildPythonApplication rec {
  format = "pyproject";
  pname = "kebihelp";
  version = "0.1.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-U4yoJ6S623J06vlKrOu4eOb/KbT68I6Nebzi9lkKjZk=";
  };

  nativeBuildInputs = [
    pkgs.python311Packages.setuptools
    pkgs.python311Packages.wheel
    pkgs.makeWrapper
    pkgs.qt6.wrapQtAppsHook
  ];

  buildInputs = [
    pkgs.qt5.qtbase
    pkgs.qt5.qtwayland
    pkgs.qt5.qttools
    pkgs.qt5.qtdeclarative
  ];

  propagatedBuildInputs = [
    pkgs.python311Packages.prettytable
    pkgs.python311Packages.pyqt5
    pkgs.python311Packages.pyqt5_sip
    pkgs.python311Packages.wcwidth
  ];

  postInstall = ''
    wrapProgram $out/bin/kebihelp \
      --prefix PYTHONPATH : $out/lib/python3.11/site-packages:${pkgs.python311Packages.prettytable}/lib/python3.11/site-packages:${pkgs.python311Packages.pyqt5}/lib/python3.11/site-packages:${pkgs.python311Packages.pyqt5_sip}/lib/python3.11/site-packages:${pkgs.python311Packages.wcwidth}/lib/python3.11/site-packages
  '';

  meta = with lib; {
    description = "A universal Keybinding helper written in Python and QT5";
    homepage = "https://github.com/juienpro/kebihelp";
    license = licenses.mit;
    maintainers = with maintainers; [ nebu ];
  };
}
