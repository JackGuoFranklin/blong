hexo clean
hexo g && gulp
hexo deploy
git add .
git commit -m 'update backup'
git push origin master