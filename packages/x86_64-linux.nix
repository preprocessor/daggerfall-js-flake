{ appimageTools, fetchurl, ... }:
let
  pname = "daggerfall-js";
  version = "0.1.11990";
in
appimageTools.wrapType2 (finalAttrs: {
  inherit pname version;
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchurl {
    url = "https://github.com/Lattymoy/daggerfall-js-source/releases/download/app-v${finalAttrs.version}/DaggerfallOnline-linux-x86_64.AppImage";
    hash = "sha256-lBEMU7hKj9huui0A671ZnGaUBon+5iBgZ0HQAJ15aWY=";
  };
})
