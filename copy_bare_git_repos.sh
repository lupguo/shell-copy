#! /bin/bash
#
# 2018/7/9
#
# tarnfer some of git repository from tk_web server to tk_srv server
# 
# 

# 测试版本
# git version

# 进入到目标机器的目录
cd /data/repos

# 仓库清单
origin_repos_list='imagebest.git 
muban.git 
uploads.git
'

# 循环拷贝仓库 & 移除远端源
for repos in $origin_repos_list;
do
    git clone --bare ssh://gitman@172.18.137.104:36000/var/repos/www/$repos
    cd $repos && git remote remove origin
    cd -
done
