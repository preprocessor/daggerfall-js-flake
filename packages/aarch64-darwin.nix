{
  stdenvNoCC,
  fetchurl,
  _7zz,
  ...
}:
let
  pname = "daggerfall-js";
  version = "0.1.11831";
in
stdenvNoCC.mkDerivation (finalAttrs: {
  inherit pname version;
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchurl {
    url = "https://github.com/Lattymoy/daggerfall-js-source/releases/download/app-v${finalAttrs.version}/DaggerfallOnline-mac-arm64.dmg";
    hash = "sha256-ym50uIk3Uyaat71Y8ZzXaf2FcniPTgSKYjLlSOyhnHo=";
  };

  nativeBuildInputs = [ _7zz ];
  sourceRoot = ".";

  unpackPhase = ''
    7zz x "$src"
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications
    cp -pR "DFO Online.app" "$out/Applications/"

    mkdir -p $out/bin
    cat << EOF > $out/bin/${pname}
    #!/usr/bin/env bash
    open "$out/Applications/DFO Online.app"
    EOF
    chmod +x $out/bin/${pname}

    runHook postInstall
  '';

  meta.mainProgram = pname;
})
