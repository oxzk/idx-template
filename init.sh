#!/bin/bash

psql --dbname=postgres -c "ALTER USER \"user\" PASSWORD 'pg123456';" || true

curl https://rclone.org/install.sh | bash -s -- -y >/dev/null 2>&1

curl -fsSL https://deno.land/install.sh | \
  SHELL=/bin/bash \
  DENO_INSTALL=$HOME/.deno \
  bash -s -- --quiet

export PATH="~/.deno/bin:$PATH"
deno install -gArf jsr:@deno/deployctl

wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.56.1/fastfetch-linux-amd64.zip
unzip fastfetch-linux-amd64.zip
mv fastfetch-linux-amd64/usr/bin/* "$HOME/.local/bin"
rm -rf fastfetch-linux-amd64*

# npm install esa-cli -g
# npm install edgeone -g
# npm install -g @openai/codex

npm install wrangler -g
npm install @anthropic-ai/claude-code -g

python -m venv .venv

echo 'alias ll="ls -la"' >>~/.bashrc
echo 'alias vi="vim"' >>~/.bashrc
echo 'export PATH="$HOME/.deno/bin:$PATH"' >>~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

cat >~/.vimrc <<EOF
syntax on
set encoding=utf-8
set smartindent
set wrap
set ruler
EOF

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
ALTER USER "user" WITH PASSWORD 'admin001';

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