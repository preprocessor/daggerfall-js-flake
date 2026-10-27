# Daggerfall Online for Nix

This flake packages [DFO Online](https://daggerfalljs.dev/)

- **Source code:** <https://github.com/Lattymoy/daggerfall-js-source>
- **Releases:** <https://github.com/Lattymoy/daggerfall-js-source/releases>

## What the flake provides

| Package | Systems | Description |
| --- | --- | --- |
| `daggerfall-js` | `x86_64-linux` `aarch64-darwin` | The desktop app, wrapped from the upstream AppImage |
| `default` | same as above | Alias for `daggerfall-js` |

## Requirements

- Nix with **flakes enabled**.
- Roughly 400 MB of disk space.

## Run it (no install)

From this repository checkout:

```bash
nix run
```

Or run it straight from GitHub, no clone needed:

```bash
nix run github:preprocessor/daggerfall-js-flake
```

## Install it

```bash
nix profile install github:preprocessor/daggerfall-js-flake#daggerfall-js
```

This adds a `daggerfall-js` command to your `PATH`:

```bash
daggerfall-js # start the game
```

To uninstall:

```bash
nix profile remove daggerfall-js
```

## Using it in NixOS or Home Manager

Add the flake as an input and pull the package into your packages list:

```nix
# flake.nix
{
  inputs.daggerfall-js.url = "github:preprocessor/daggerfall-js-flake";

  # then, e.g. in your NixOS or Home Manager module:
  # environment.systemPackages = [ inputs.daggerfall-js.packages.${pkgs.stdenv.hostPlatform.system}.daggerfall-js ];
  # home.packages = [ inputs.daggerfall-js.packages.${pkgs.stdenv.hostPlatform.system}.daggerfall-js ];
}
```
