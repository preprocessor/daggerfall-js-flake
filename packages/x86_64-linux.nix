{ appimageTools, fetchurl, ... }:
let
  pname = "daggerfall-js";
  version = "0.1.14473";
in
appimageTools.wrapType2 (finalAttrs: {
  inherit pname version;
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchurl {
    url = "https://github.com/Lattymoy/daggerfall-js-source/releases/download/app-v${finalAttrs.version}/DaggerfallOnline-linux-x86_64.AppImage";
    hash = "sha256-0blC9j/tKBol6vjjAb14+bet8bF4TKZlS1+PRhfbL9c=";
  };
})
