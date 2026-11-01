{ appimageTools, fetchurl, ... }:
let
  pname = "daggerfall-js";
  version = "0.1.14487";
in
appimageTools.wrapType2 (finalAttrs: {
  inherit pname version;
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchurl {
    url = "https://github.com/Lattymoy/daggerfall-js-source/releases/download/app-v${finalAttrs.version}/DaggerfallOnline-linux-x86_64.AppImage";
    hash = "sha256-2PdZi1cNy9h5y/jJzEng3Y8sxUt57ZARr63A79jb/3A=";
  };
})
