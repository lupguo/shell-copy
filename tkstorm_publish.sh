#!/bin/sh
#
# An example hook script to prepare a packed repository for use over
# dumb transports.
# 
# Date: 2018-05-11
#

# 相关初始化
build_root=/home/gitman/projects/tkstorm.com
www_root=/data/www/tkstorm.com
www_public=${www_root}/public
www_build=${www_root}/build/`date +%Y%m%d_%H%M%S`

nowuser=$(whoami)
publisher=gitman
HUGO=/usr/sbin/hugo
logfile=/var/log/git/receive-push.log

echo "[PUBLISH BEGIN...]" |tee -a $logfile 

# 准备发布
unset GIT_DIR
cd $build_root

# 检测发布条件
check_publish_user() {
    echo "[PUBLISH USER CHECKING...]"
    if [ $nowuser != $publisher ]; then
      echo "PUBLISH ERROR: current user($nowuser) isn't match the publish user(${publisher}), please check again..."
      exit 1
    fi
    
    if [ !-d `dirname $www_build` ]; then
      mkdir -p `dirname $www_build` || echo "PUBLISH ERROR: www_build(`dirname $www_build`) not exist, please check again... "
      exit 1
    fi
}

# 内容代码更新
update_content() {
    echo "[UPDATE THE GIT THINGS...]"
    git checkout master | tee -a $logfile
    git pull origin master |tee -a $logfile 

    echo "[UPDATE THE SUBMODULE...]"
    git submodule update --remote
}

# 更新hugo的config配置信息
update_config() {
    cp -f config.prod.yaml config.yaml
}

# hugo进行重新构建
build_project() {
    # hugo构建
    echo "[HUGO BUILDING PROJECT...]"
    $HUGO -v --cleanDestinationDir|tee -a $logfile 

    # 同步文档
    [ ! -d "$www_build" ] && mkdir -p $www_build 
    rsync -az --exclude-from=.rsync-filter public/ $www_build
    
    # 重做软链
    if [ -L "$www_public" ]; then
      unlink $www_public && ln -s $www_build $www_public || exit 9
    else 
      ln -s $www_build $www_public || exit 9
    fi

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
