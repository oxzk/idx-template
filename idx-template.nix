{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
    pkgs.python311
    pkgs.deno
  ];
  bootstrap = ''   
    mkdir "$out"
    cp -rf ${./bin} "$out"
    cp -rf ${./.idx} "$out"
    cp -rf ${./.vscode} "$out"
    chmod -R +w "$out"
    cd "$out"
  '';
}