{ pkgs, ... }: {
  packages = [
  ];
  bootstrap = ''   
    mkdir -p "$out"/.idx "$out"/.vscode
    cp -r ${./.idx}/. "$out/.idx/"
    cp -r ${./.vscode}/. "$out/.vscode"
    chmod -R u+w "$out"
  '';
}