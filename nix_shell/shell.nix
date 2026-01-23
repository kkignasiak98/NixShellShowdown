let
  # to use different channels follow tags https://github.com/NixOS/nixpkgs/tags
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz";
  nixpkgs-unstable = fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.11-beta.tar.gz";
  nixpkgs-old = fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/19.09.tar.gz";

  pkgs = import nixpkgs {};
  pkgs-unstable = import nixpkgs-unstable {};
  pkgs-old = import nixpkgs-old {};
in
  pkgs.mkShell {
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
      pkgs.devpod
      pkgs.go-task
      pkgs.lazydocker

      pkgs-old.R # Example of old version 3.6.1
      pkgs.python314
      pkgs.go
      pkgs-unstable.julia # Example how to use unstable channel
    ];
  }
