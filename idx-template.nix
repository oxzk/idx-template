{ pkgs, ... }: {
  packages = [
  ];
  bootstrap = ''   
    mkdir -p "$out"/.idx "$out"/.vscode "$out"/.bin
    cp -r ${./.idx}/. "$out/.idx/"
    cp -r ${./.vscode}/. "$out/.vscode"
    cp -r ${./.bin}/. "$out/.bin"
    chmod +x "$out/.bin/"*
    chmod -R u+w "$out"
  '';
}