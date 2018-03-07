#!/bin/bash
git add --all
git commit -m "提交代码"
echo "请选择要提价的分支"
echo "1 - master"
echo "2 - develop"
read describe
tempbarch="develop"
if [ $describe == 1 ]
then
tempbarch="master"
fi

git pull origin $tempbarch

git push origin $tempbarch
