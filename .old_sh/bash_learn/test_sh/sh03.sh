#!/bin/bash
#Program 
#	在当前日期基础上创建文件

#用户输入一个文件名称：
echo "按日期创建程序..."
read -p "输入一个文件名称：" filename
#检测filename
filename=${filename:-"nofilename"}
#创建file
curDate=$(date "+%Y%m%d%H%M")
file1=${filename}${curDate}
touch $file1 && echo "创建文件成功：$file1" && exit 0
