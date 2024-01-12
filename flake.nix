{
  description = "My personal NUR repository";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11"; # Nix Packages
  };
  outputs = inputs @ { self, nixpkgs,... }:
    let
      systems = [
        "x86_64-linux"
        "i686-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "armv6l-linux"
        "armv7l-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      legacyPackages = forAllSystems (system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./default.nix {inherit pkgs;});
      packages = forAllSystems (system: nixpkgs.lib.filterAttrs (_: v: nixpkgs.lib.isDerivation v) self.legacyPackages.${system});
    };
}
