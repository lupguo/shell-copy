#!/bin/bash
#
# hugo打包部署tkstorm.com 脚本
#
# Date: 2018-05-11
#

# 相关初始化
projectGitPath="/home/gitman/projects/tkstorm.com"
projectGitBranch="master"

deployer="gitman"
buildProjectPath="/data/www/tkstorm.com"
buildSavePath="${buildProjectPath}/build"
websitePublicLink="${buildProjectPath}/public"

# 本次构建
buildPublicPath="$buildSavePath/$(date +%Y%m%d_%H%M%S)"

# 磁盘最多保存部署次数
limitNum=10

# 1. 准备发布
echo "[deploy start... 🚀🚀🚀 ]"

# 检测发布用户
currentUser=$(whoami)
echo "[deploy user account checking... ]"
if [ "$currentUser" != $deployer ]; then
	echo "[Error]: current user[$currentUser] isn't match the deploy user: ${deployer}, reset an try again..."
	exit 1
fi

# 检测构建目录(包含日期)
echo "[deploy user account checking... ]"
if [ ! -d "$(dirname ${buildPublicPath})" ]; then
	mkdir -p "$(dirname ${buildPublicPath})" || echo "[Error]: buildPublicPath($(dirname $buildPublicPath)) not exist, please check again... "
	exit 1
fi

# 2. git仓库代码更新
echo "[✅ git deploy check ok. now begin update the git repository... 🚀🚀🚀 ]"

# a) git 更新tkstorm.com项目
cd ${projectGitPath} || exit
git checkout $projectGitBranch
#git reset --hard

git pull origin $projectGitBranch || exit 1
echo "[✅ git pull tkstorm.com repository done. ]"

# b) git 更新submodule内容
echo "[update the submodule repository... ]"
git submodule update --remote|| exit 1
echo "[✅ git submodule update done. ]"

# 3. hugo构建
echo "[hugo build project... 🚀🚀🚀]"
hugo -v --minify --cleanDestinationDir || exit 1
echo "[✅ hugo build done. ]"

# 4. 将构建内容同步到指定目录
echo "[rsync website public files to build path ... 🚀🚀🚀]"
[ ! -d "$buildPublicPath" ] && mkdir -p "$buildPublicPath"
rsync -az --exclude-from=.rsync-filter public/ $buildPublicPath || exit 1
echo "[✅ rsync public to $buildPublicPath ok. ]"

# 5. 重做public软链
echo "[unlink and relink the website public dir ... 🚀🚀🚀]"
if [ -L "$websitePublicLink" ]; then
	unlink $websitePublicLink && ln -s "$buildPublicPath" $websitePublicLink || exit 9
else
	ln -s $buildPublicPath $websitePublicLink || exit 9
fi
echo "[✅ relink website to public path ok. ]"

# 6. 部署完成，定期清理内容，最多保存10个
echo "[clean build path, keep only ($limitNum) build records ... 🚀🚀🚀]"
cleanPath=($(ls -dt $buildSavePath/* | sort))
curNum=${#cleanPath[@]}
if ((curNum >= 2*limitNum)); then
  for i in $(seq 1 $limitNum); do
		toDeletePath="${cleanPath[$i]}"

		# 需要做下检查，避免误删了其他系统文件
		if [[ $toDeletePath == *${buildSavePath}* ]]; then
			echo "try delete index dir:$i , path:${cleanPath[$i]}..."
			rm -rf $toDeletePath || exit 1
		fi
	done
	echo "[✅ clean website build path ok. ]"
else
	echo "[needn't clean records curNum=($curNum), limitNum=($limitNum)]"
fi

echo "[👏👏👏deploy success]...."
