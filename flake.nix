{
  description = "Daggerfall Online for Nix";

  inputs.nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      systemPkgs = f: system: f nixpkgs.legacyPackages.${system} system;
      supportedSystems = f: nixpkgs.lib.genAttrs systems (systemPkgs f);
    in
    {
      packages = supportedSystems (
        pkgs: system: {
          daggerfall-js = pkgs.callPackage ./packages/${system}.nix { };
          default = self.packages.${system}.daggerfall-js;
        }
      );
    };
}
