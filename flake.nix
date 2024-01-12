{
  description = "My personal NUR repository";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11"; # Nix Packages
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # Nix Packages

    emacs-overlay = {
        url = "github:nix-community/emacs-overlay/master";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
        inputs.nixpkgs-stable.follows = "nixpkgs";
        inputs.flake-utils.follows = "flake-utils";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    systems.url = "github:nix-systems/default";

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
        import ./default.nix {inherit pkgs inputs;});
      packages = forAllSystems (system: nixpkgs.lib.filterAttrs (_: v: nixpkgs.lib.isDerivation v) self.legacyPackages.${system});
    };
}
