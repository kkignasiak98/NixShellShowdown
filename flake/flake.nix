{
  description = "A Nix-flake-based development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs_unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    flake-utils.url = "github:numtide/flake-utils"; # to enable multi-platform support
  };

  outputs = { self, nixpkgs , nixpkgs_unstable, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          pkgsUnstable = nixpkgs_unstable.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
           buildInputs = [
                  pkgs.bat
                  pkgs.atuin
                  pkgs.zellij
                  pkgs.starship
                  pkgs.lazygit
                  pkgs.yazi
                  pkgs.helix
                  pkgs.dotbot
                  pkgs.eza
                  pkgs.fzf
                  pkgs.zoxide
                  pkgs.git
                  pkgs.lazydocker
                  pkgs.devpod
                  pkgs.go-task
                  pkgs.python3
                  pkgs.go
                  pkgs.R
                  pkgsUnstable.julia
            ];
            
            shellHook = ''
                exec zsh
                '';     
           };
      });
}