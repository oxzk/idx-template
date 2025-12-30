{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
    pkgs.python311
    pkgs.deno
  ];
  bootstrap = ''   
    mkdir "$out"
    mkdir "$out"/.idx
    mkdir "$out"/.vscode
    mkdir "$out"/.bin
    cp -r ${./.idx}/. "$out/.idx/"
    cp -r ${./.vscode}/. "$out/.vscode"
    cp -r ${./bin}/. "$out/.bin"
    chmod -R u+w "$out"
    chmod -R u+x "$out/devserver.sh"
  '';
}