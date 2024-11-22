{ lib, buildNpmPackage, fetchFromGitHub }:

buildNpmPackage
rec {
  pname = "repomix";
  version = "0.2.3";

  src = fetchFromGitHub {
    owner = "yamadashy";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-HTBlAne4pkfsy8+bAKIf9Mj1t11PWCFowJr/+i4yZ20=";
  };

  npmDepsHash = "sha256-VWV1Cl4KSl0t7Gmj7L8n0bJDY6A7qHWVKEyXAr2LDdY=";
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
