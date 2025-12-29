#!/bin/bash

mkdir ~/bin

curl https://rclone.org/install.sh | bash

curl -fsSL https://deno.land/install.sh | bash
export PATH="~/.deno/bin:$PATH"
deno install -gArf jsr:@deno/deployctl

wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.56.1/fastfetch-linux-amd64.zip
unzip fastfetch-linux-amd64.zip
mv fastfetch-linux-amd64/usr/bin/* ~/bin/
rm -rf fastfetch-linux-amd64*

npm install esa-cli -g
npm install edgeone -g
npm install wrangler -g
npm install @anthropic-ai/claude-code -g

python -m venv .venv

echo 'export PATH=~/bin:$PATH' >>~/.bashrc

rm -f init.sh LICENSE