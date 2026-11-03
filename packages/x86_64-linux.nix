{ appimageTools, fetchurl, ... }:
let
  pname = "daggerfall-js";
  version = "0.1.14517";
in
appimageTools.wrapType2 (finalAttrs: {
  inherit pname version;
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchurl {
    url = "https://github.com/Lattymoy/daggerfall-js-source/releases/download/app-v${finalAttrs.version}/DaggerfallOnline-linux-x86_64.AppImage";
    hash = "sha256-9hiIm6XfCrSm/FyNo3u0SbdRDsdi3LQaxaC8xy8ULds=";
  };
})
