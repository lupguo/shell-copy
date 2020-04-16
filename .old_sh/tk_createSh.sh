#!/bin/bash
#Purpose:
#	该script主要用于创建script，从/home/Terry/sh/demo_en.sh 拷贝过来的
#History:
#Special:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/home/Terry/sh
export PATH

#Demo Sh所在的位置
demoSh=/home/Terry/sh/demo/demo_sh_en

#获取新shell名称
if [ "$#" -eq 0 ]; then
	#无参数
	read -p "输入想创建的SH的名称：" newShName
	if [ -z "$newShName" ]; then 
		echo "创建新sh失败，新Shell Script名称不能为空!！" && $0 && exit 1
	fi
else
	newShName="$1"
fi

#检测sh文件是否可以被创建(是否已存在，是否符合命名规则)
testing=$(echo "$newShName"|grep -E "^[a-zA-Z0-9_]+\.sh$")
if [ "$testing" == "" ]; then
	echo "sh的命令格式错误，请参照[a-zA-Z0-9_].sh的格式命名！" && $0 && exit 1
elif [ -e "$newShName" ]; then	
	echo "$(pwd)/$newShName已存在，请重新为Shell Script命名！" && $0 && exit 1
fi

#读取 Sh内容
curTime=$(date '+%Y/%m/%d %H:%M:%S')
dateShow=$(echo -e "#Date:\t\t${curTime}")
fileName=$(basename "${newShName}")
cat $demoSh |sed -e "s/ScriptName$/${fileName}/"  -e "10a \\\nPATH=${PATH}\nexport PATH" -e "9c ${dateShow}" > $newShName
chmod 755 $newShName
ls -al $newShName
