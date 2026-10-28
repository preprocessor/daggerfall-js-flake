{ appimageTools, fetchurl, ... }:
let
  pname = "daggerfall-js";
  version = "0.1.12022";
in
appimageTools.wrapType2 (finalAttrs: {
  inherit pname version;
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchurl {
    url = "https://github.com/Lattymoy/daggerfall-js-source/releases/download/app-v${finalAttrs.version}/DaggerfallOnline-linux-x86_64.AppImage";
    hash = "sha256-Z8UR3p3ERkGr2lMawSzILc+0AIo6Sw1XhTZ3U+vAhik=";
  };
})
