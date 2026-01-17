{ pkgs, ... }: {
  packages = [
  ];
  bootstrap = ''   
    mkdir -p "$out"/.idx "$out"/.vscode "$out"/data
    cp -r ${./.idx}/. "$out/.idx/"
    cp -r ${./.vscode}/. "$out/.vscode/"
    cp -r ${./data}/. "$out/data/"
    cp ${./docker-compose.yml} "$out/docker-compose.yml"
    cp ${./init.sh} "$out/init.sh"
    chmod -R u+w "$out"
  '';
}