#!/bin/sh
#***************** author:zhaixd<xiaodong137038@163.com> *********************
set -e

# check git exist
if ! [ -x "$(command -v git)" ]; then
  echo 'git is not installed,begin install……'
  yum install -y git
fi

sleep 1
git version

# clone docker-compose script files
echo 'clone docker-compose script files'
#git init redis-tmp && cd redis-tmp
git init
git config core.sparsecheckout true
echo 'redis-cluster' >> .git/info/sparse-checkout
git remote add origin https://github.com/angleszhaixd/docker-compose.git
git pull origin master

chmod +x -R ./redis-cluster
rm -rf ./.git
cd ./redis-cluster

# move docker-compose script files
#echo 'move docker-compose script files'
#mkdir -pv ../redis-cluster && mv -f ./redis-cluster/* ../redis-cluster
#cp -rf ./redis-cluster/.* ../redis-cluster
#sleep 1
#cd ../redis-cluster
#rm -rf ../redis-tmp
#alias proj="cd ./redis-cluster"
