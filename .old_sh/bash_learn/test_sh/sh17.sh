#!/bin/bash
#Program	sh17.sh
#Version	1.0
#Date		2015/4/29
#Purpose
#	检测用户输入的某个目录下子文件的权限

# 让用户输入dir
read -p "请输入测试目录:" dir
if [ ! -d "$dir" ];then
	echo "非目录文件!" && exit 1
fi

fileList=$(ls $dir)
cd $dir
for file in $fileList
do
	test -r "$file" && prop="可读" || prop="不可读"
	test -w "$file" && prop="${prop}、可写" || prop="${prop}、不可写"
	test -x "$file" && prop="${prop}、可执行" || prop="${prop}、不可执行"
	echo "$file权限:$prop"
done

