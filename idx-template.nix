{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
    pkgs.python311
    pkgs.deno
  ];
  bootstrap = ''   
    mkdir "$WS_NAME"
    cp -rf ${./bin} "$WS_NAME"
    cp -rf ${./.idx} "$WS_NAME"
    cp -rf ${./.vscode} "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
    cd "$out"
  '';
}