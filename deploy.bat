@echo off
REM ==== 切換到網站根目錄 ====
cd /d E:\my-website

echo [1/6] 清除舊的 public/
rmdir /S /Q public
mkdir public

echo [2/6] 產生最新靜態頁面
hugo

echo [3/6] 進入 public 並初始化 Git 倉庫
cd public
rmdir /S /Q .git
git init
git remote add origin https://github.com/weimenglin/my-website.git
git checkout -b gh-pages

echo [4/6] 加入所有檔案並提交
git -c user.name="weimenglin" -c user.email="cyberatedison@gmail.com" add .
git -c user.name="weimenglin" -c user.email="cyberatedison@gmail.com" commit -m "Deploy site"

echo [5/6] 強制推送到 gh-pages 分支
git push -f origin gh-pages

cd ..
echo [6/6] ? 部署完成！請前往：https://weimenglin.github.io/my-website/
pause
