{
  description = "A Nix-flake-based development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs_unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
  };

  outputs = { self , nixpkgs , nixpkgs_unstable ,... }: let
    # system should match the system you are running on
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs { inherit system; };
      pkgsUnstable = import nixpkgs_unstable { inherit system; };
    in pkgs.mkShell {
      
      packages = [
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
        pkgs.zsh
      ];

      shellHook = ''
        exec zsh
      '';
    };
  };
}