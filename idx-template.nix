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
    cd "$out"

    python -m venv .venv
    deno install -gArf jsr:@deno/deployctl
    npm install esa-cli -g
    npm install edgeone -g
    npm install wrangler -g
    npm install @anthropic-ai/claude-code -g
    echo 'export PATH=~/bin:$PATH' >>~/.bashrc
  '';
}