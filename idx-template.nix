{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
    pkgs.python311
    pkgs.deno
  ];
  bootstrap = ''   
    mkdir "$WS_NAME"
    cp -r ${./.}/* "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"

    mkdir -p "$out/.idx"
    cp -rf ${./.idx/dev.nix} "$out/.idx/dev.nix"
    chmod -R u+w "$out"

    cd "$out"
    npm install wrangler -g
    npm install @anthropic-ai/claude-code -g
    python -m venv .venv
  '';
}