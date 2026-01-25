
#!/usr/bin/env bash
set -e

source .venv/bin/activate

# 判断是否有正在运行的容器
if docker compose ps --status running -q | grep -q .; then
    echo "✅ Docker Compose 容器正在运行，跳过操作"
    exit 0
fi

echo "🚀 未发现运行中的容器，开始重启环境"

docker compose down
docker system prune -a --volumes -f
docker compose up -d

echo "✅ Docker Compose 启动完成"
