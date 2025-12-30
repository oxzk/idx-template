{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
    pkgs.python311
  ];
  bootstrap = ''   
    mkdir "$out"
    mkdir "$out"/.idx
    mkdir "$out"/.vscode
    mkdir "$out"/.bin
    cp -r ${./.idx}/. "$out/.idx/"
    cp -r ${./.vscode}/. "$out/.vscode"
    cp -r ${./.bin}/. "$out/.bin"
    npm install wrangler -g
    npm install @anthropic-ai/claude-code -g
    echo 'export PATH="$HOME/$out/.bin:$PATH"' >> ~/.bashrc
    chmod -R u+w "$out"
    rm -rf "$out/.git"
  '';
}