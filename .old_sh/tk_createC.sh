#!/bin/bash
#ScriptName:	tk_createC.sh
#Purpose:
#		该Shell脚本主要用于创建C程序，依据demo下的c模板来创建*.c的文件	
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2015/01/26 16:55:42
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/home/Terry/sh
export PATH

#c文件模板路径
demoC=/home/Terry/sh/demo/demo_c_en

if [ -z "$1" ]; then
	read -p "请输入C程序的文件名，文件名格式参照[a-zA-Z0-9_].c的模式：" cfile
else
	cfile="$1"
fi

#检测用户输入的文件名称
fileName=$(basename "$cfile")
testing=$(echo $fileName|grep -E '^[a-zA-Z0-9_]+\.c$')
if [ -z "$testing" ]; then
	echo -E "C程序的名称格式错误！"	 && $0 && exit 1
elif [ -f "$cfile" ]; then
	echo -E "文件$cfile已存在了！" && $0 && exit 1
fi

#检测文件所在路径是否存在
filePath=$(dirname $cfile)
if [ ! -d $filePath ]; then
	mkdir -p $filePath
fi

#导出模板文件，变更些许参数
curDate=$(date "+%Y-%m-%d %H:%M:%S")
programName="$fileName"
cat $demoC|sed "s/{programName}/$programName/"|sed "s/{date}/$curDate/" > $cfile && ls -al $cfile && exit 0













