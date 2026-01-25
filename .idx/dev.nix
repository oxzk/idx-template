# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.go
    pkgs.python311
    # pkgs.python311Packages.pip
    pkgs.nodejs_22
    pkgs.openssh
    # pkgs.deno
    pkgs.gcc
    pkgs.cmake
    pkgs.rustup
    pkgs.cloudflared
    pkgs.openssl
    pkgs.sing-box
  ];
  # Sets environment variables in the workspace
  env = {
    PORT = "19002";
    HOST = "0.0.0.0";
    SSH_PASSWORD = "admin001";
    CLOUDFLARE_TUNNEL_TOKEN = "";
    POSTGRESQL_CONN_STRING = "postgresql://user:pg123456@localhost:5432/postgres?sslmode=disable";
  };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
      "google.gemini-cli-vscode-ide-companion"
      "ms-python.python"
      "ms-python.black-formatter"
      "dracula-theme.theme-dracula"
      "golang.go"
      "pkief.material-icon-theme"
      "esbenp.prettier-vscode"
      "foxundermoon.shell-format"
      "denoland.vscode-deno"
      "anthropic.claude-code"
      "redhat.vscode-yaml"
      "bungcip.better-toml"
      "rust-lang.rust-analyzer"
      # "k--kato.intellij-idea-keybindings"
      "vue.volar"
      "mongodb.mongodb-vscode"
      "mtxr.sqltools"
      "mtxr.sqltools-driver-pg"
      "mtxr.sqltools-driver-mysql"
    ];
    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
      };
    };
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
        # Open editors for the following files by default, if they exist:
        # python-venv = "python -m venv .venv";
        workspace-init = "bash init.sh && rm -rf .git";
        # default.openFiles = [ "README.md" ];
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        workspace-start = "bash start.sh";
      };
    };
  };
  services.docker = {
    enable = true;
  };
  services.mongodb = {
    enable = true;
    port = 27017;
  };
  services.postgres = {
    enable = true;
  };
  services.redis = {
    enable = true;
    port = 6379;
  };
  services.mysql = {
    enable = true;
  };
}
