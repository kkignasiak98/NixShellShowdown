{
  description = "Development shell for NixShellShowdown (converted from nix_shell/shell.nix)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/24.11-beta";
    nixpkgs-old.url = "github:NixOS/nixpkgs/19.09";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixpkgs-old, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pkgs-unstable = import nixpkgs-unstable { inherit system; };
      pkgs-old = import nixpkgs-old { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.python311Full
          pkgs.python311Packages.pip
          pkgs.poetry
          pkgs.git
          pkgs.just
          pkgs-old.R
        ];

        shellHook = ''
          echo "Development shell for NixShellShowdown (from flake.nix)"
        '';
      };
    };
