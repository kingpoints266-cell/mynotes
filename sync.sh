#!/bin/zsh

echo "🔄 正在保存本地笔记..."
git add .
# Mac 下获取当前日期和时间的语法稍有不同
git commit -m "auto update $(date '+%Y-%m-%d %H:%M:%S')"

echo "⬇️ 正在同步云端最新记录 (处理分叉)..."
git pull origin main --rebase

echo "⬆️ 正在推送到 GitHub..."
git push origin main

echo "✅ 更新与同步完成！"