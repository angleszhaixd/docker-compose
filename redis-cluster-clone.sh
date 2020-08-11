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
git init redis-tmp && cd redis-tmp
git config core.sparsecheckout true
echo 'redis-cluster' >> .git/info/sparse-checkout
git remote add origin https://github.com/angleszhaixd/docker-compose.git
git pull origin master

# move docker-compose script files
echo 'move docker-compose script files'
mkdir -pv ../redis-cluster && mv -f ./redis-cluster/* ../redis-cluster
cd ../redis-cluster
rm -rf ../redis-tmp
