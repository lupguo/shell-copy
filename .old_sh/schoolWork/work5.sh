#!/bin/bash
#Program	work5.sh
#Version	1.0
#Date		2015/4/30
#Author		Terry
#Purpose
#	检测制定路径下的文件信息	
#

echo "--------------------------------------------------------------"
echo "文件检测相关"
echo "	注意点"
echo "	1.文件是否存在 -e file来判断"
echo "--------------------------------------------------------------"

# 检测的文件
testFile="/tmp/test/logical"

if [ -e "$testFile" ];then
	echo -n "文件存在！"
	if [ -f "$testFile" ];then
		echo "该文件为常规文件!按要求删除该文件，并创建一个logical的目录"
		rm $testFile
		mkdir -p $testFile
	elif [ -d "$testFile" ];then
		echo "该文件为目录文件！因为是目录文件，按要求需要删除该目录..."
		rmdir $testFile
	fi
else
	echo "文件不存在，用touch创建:"
	mkdir -p $(dirname $testFile)
	touch $testFile
fi




