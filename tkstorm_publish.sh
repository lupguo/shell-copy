#!/bin/sh
#
# An example hook script to prepare a packed repository for use over
# dumb transports.
# 
# Date: 2018-05-11
#

# 相关初始化
webroot=/data/www/tkstorm.com/
build_dir=/data/www/tkstorm.com/publish_build/public_`date +%Y%m%d_%H%M%S`
nowuser=$(whoami)
publisher=gitman
HUGO=/usr/local/bin/hugo
logfile=/var/log/git/receive-push.log

echo "[PUBLISH BEGIN...]" |tee -a $logfile 

# 准备发布
unset GIT_DIR
cd $webroot

# 检测发布的用户
check_publish_user() {
    echo "[PUBLISH USER CHECKING...]"
    if [ $nowuser != $publisher ]; then
        echo "PUBLISH ERROR: current user($nowuser) isn't match the publish user(${publisher}), please check again..."
        exit 1
    fi
}

# 设置相关HTTP、HTTPS、未指定协议(更多参考man curl)
start_proxy() {
    socks5_proxy=socks5h://localhost:10443
    export http_proxy=$socks5_proxy; 
    export HTTPS_PROXY=$socks5_proxy; 
    export ALL_PROXY=$socks5_proxy;
    
}

# 内容代码更新
update_content() {
    echo "[UPDATE THE GIT THINGS...]"
    git checkout master | tee -a $logfile
    git pull origin master |tee -a $logfile 
# git rebase HEAD  master |tee -a $logfile

    echo "[UPDATE THE SUBMODULE...]"
    #start_proxy
    git submodule update --remote
}

# 更新hugo的config配置信息
update_config() {
    #cp -f config.prod.toml config.toml
    cp -f config.prod.yaml config.yaml
}

# hugo进行重新构建
build_project() {
    echo "[HUGO BUILDING PROJECT...]"
    $HUGO -d $build_dir -v |tee -a $logfile 
    
    # 重新做软链接
    unlink public && ln -s $build_dir public

    echo "[PUBLISH COMPLETE]...."
}

# 发布用户检测
check_publish_user

# 内容更新
update_content

# 配置替换
update_config

# hugo构建
build_project
