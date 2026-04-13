@echo off
git add .
git commit -m "auto update %date:~0,10% %time:~0,8%"
git push origin main
echo Update Complete!
pause