{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
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
    pkgs.devpod
    pkgs.go-task
    pkgs.lazydocker
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;
  languages.python.enable = true;
  languages.python.version = "3.14.0";
  languages.go.enable = true;
  languages.go.version = "1.25.4";
  languages.r.enable = true;
  languages.julia.enable = true;



  # https://devenv.sh/processes/
  # processes.dev.exec = "${lib.getExe pkgs.watchexec} -n -- ls -la";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  # https://devenv.sh/basics/
  enterShell = ''
    hello         # Run scripts directly
    git --version # Use packages
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
