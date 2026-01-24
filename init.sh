#!/bin/bash

mkdir ~/bin

curl https://rclone.org/install.sh | bash -s -- -y >/dev/null 2>&1

curl -fsSL https://deno.land/install.sh | \
  SHELL=/bin/bash \
  DENO_INSTALL=$HOME/.deno \
  bash -s -- --quiet

export PATH="~/.deno/bin:$PATH"
deno install -gArf jsr:@deno/deployctl

wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.56.1/fastfetch-linux-amd64.zip
unzip fastfetch-linux-amd64.zip
mv fastfetch-linux-amd64/usr/bin/* ~/bin/
rm -rf fastfetch-linux-amd64*

# npm install esa-cli -g
# npm install edgeone -g
# npm install -g @openai/codex

npm install wrangler -g
npm install @anthropic-ai/claude-code -g

python -m venv .venv

echo 'export PATH=~/.deno/bin:$PATH' >>~/.bashrc
echo 'export PATH=~/bin:$PATH' >>~/.bashrc

cat > ~/.claude/settings.json << EOF
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "sk-cRYF1kQwKBJ",
    "ANTHROPIC_BASE_URL": "https://gyapi.zxiaoruan.cn",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_MODEL": "claude-opus-4-5-20251101"
  }
}
EOF

cat > README.md <<'EOF'
```
git checkout --orphan empty-branch

curl https://kfc-api.sxxe.net/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer xxx" \
  -d '{
  "model": "GLM-4.6",
  "messages": [
      {
        "role": "user",
        "content": "What is the meaning of life?"
      }
    ]
  
}'

```
EOF

rm -f init.sh