let
  # to use different channels follow tags https://github.com/NixOS/nixpkgs/tags
  pkgs-unstable = import (import ./npins).nixpkgs-unstable { };
  pkgs-old = import (import ./npins).nixpkgs-old { };
  pkgs = import (import ./npins).nixpkgs{ };

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
      pkgs.python3
      pkgs.go
      pkgs-unstable.julia # Example how to use unstable channel
    ];
  }
