{
  pkgs,
  ...
}:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [
    pkgs.fennel-ls
    pkgs.fnlfmt
    pkgs.git
    pkgs.gitleaks
    pkgs.nil
    pkgs.pre-commit
    pkgs.python313Packages.pre-commit-hooks
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

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
    sed "s|{{dir}}|$DEVENV_ROOT|g" template.lua > "$HOME"/.config/nvim/lua/plugins/sentence.lua
    # https://dev.fennel-lang.org/wiki/LanguageServer#:~:text=Make%20sure%20the,fennel%2Dls/docsets/
    mkdir -p "$HOME"/.local/share/fennel-ls/docsets/
    if [ ! -f "$HOME"/.local/share/fennel-ls/docsets/nvim.lua ]; then
      # https://dev.fennel-lang.org/wiki/LanguageServer#:~:text=curl%20%2Do%20%24HOME/.local/share/fennel%2Dls/docsets/nvim.lua%20https%3A//git.sr.ht/~micampe/fennel%2Dls%2Dnvim%2Ddocs/blob/main/nvim.lua
      curl -sLo "$HOME"/.local/share/fennel-ls/docsets/nvim.lua https://git.sr.ht/~micampe/fennel-ls-nvim-docs/blob/30e1fbdf2443af7e7e5fe72171363cc4fa28f879/nvim.lua
    fi
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
  git-hooks.hooks = {
    fnlfmt = {
      enable = true;
      entry = "fnlfmt --fix";
      files = "\\.fnl$";
    };
    gitleaks = {
      enable = true;
      # https://github.com/gitleaks/gitleaks/blob/8d1f98c7967eb1e79cb44ac6241a124e145d2165/.pre-commit-hooks.yaml#L4
      # Direct execution of gitleaks here results in '[git] fatal: cannot change to 'devenv.nix': Not a directory'.
      entry = "bash -c 'exec gitleaks git --redact --staged --verbose'";
    };
    lua-ls.enable = true;
    # https://github.com/NixOS/nixfmt/blob/5513ad83a6e8e203d76215ed17c9e0bccbe5b55c/README.md?plain=1#L169
    nixfmt.enable = true;
    prettier.enable = true;
    stylua = {
      enable = true;
      excludes = [ "^lua" ];
    };
    trailing-whitespace = {
      enable = true;
      # https://github.com/pre-commit/pre-commit-hooks/blob/5c514f85cc9be49324a6e3664e891ac2fc8a8609/.pre-commit-hooks.yaml#L205-L212
      entry = "trailing-whitespace-fixer";
      types = [ "text" ];
    };
  };

  # See full reference at https://devenv.sh/reference/options/
}
