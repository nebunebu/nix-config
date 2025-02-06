{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage rec {
  pname = "repomix";
  version = "0.2.6";

  src = fetchFromGitHub {
    owner = "yamadashy";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-ZYU85782Z6O69KkKu4h3OqJqAgaxktEgHkcfs2ms9xg=";
  };

  npmDepsHash = "sha256-r+RIa7ACXJv4/CutnN/3S36US6r7w0EkM9dA4ShWPdU=";
  npmPackFlags = [ "--ignore-scripts " ];
  NODE_OPTIONS = "--openssl-legacy-provider ";

  buildPhase = ''
    runHook preBuild
    npm run build
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/lib/node_modules/${pname}
    cp -r . $out/lib/node_modules/${pname}
    mkdir -p $out/bin
    ln -s $out/lib/node_modules/${pname}/bin/${pname}.cjs $out/bin/${pname}
    runHook postInstall
  '';

  meta = {
    description = "A tool that packs your entire repository into a single, AI-friendly file";
    homepage = "https://github.com/yamadashy/repopack";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ nebunebu ];
  };
}
