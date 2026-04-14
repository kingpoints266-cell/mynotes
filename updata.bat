@echo off
echo 🔄 正在保存本地笔记...
git add .
git commit -m "auto update %date:~0,10% %time:~0,8%"

echo ⬇️ 正在同步云端最新记录 (处理分叉)...
git pull origin main --rebase

echo ⬆️ 正在推送到 GitHub...
git push origin main

echo ✅ 更新与同步完成！Update Complete!
pause