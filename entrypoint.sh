#!/bin/sh

# 1. 检查是否存在 TOKEN 环境变量
if [ -z "$TOKEN" ]; then
    # 如果没有提供 TOKEN，生成一个随机的 UUID
    # 使用 tr 命令从 urandom 生成 16 位随机字符
    TOKEN=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    echo "⚠️  警告: 未检测到 TOKEN 环境变量。"
    echo "✅ 已自动生成随机 Token: $TOKEN"
else
    echo "✅ 检测到 TOKEN 环境变量，将使用预设 Token。"
fi

# 2. 启动程序
# "$@" 允许你以后在 docker run 后面追加其他参数
echo "🚀 正在启动 ech-tunnel..."
exec ./ech-tunnel -l ws://0.0.0.0:8080/tunnel -token "$TOKEN"
