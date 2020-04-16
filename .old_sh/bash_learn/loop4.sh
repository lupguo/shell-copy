#!/bin/bash
#ScriptName:	loop4.sh
#Purpose:
#	当用户输入一个目录时候，检测目录下面的文档权限		
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/30 09:17:48
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#帮助函数
_help(){
	read -p "格式不对，请重新输入一个目录：" dir
}

#检测函数
_check(){
	#文件类型
	file="$dir/$1"
	if [ -d "$file" ]; then
		#目录
		typeDoc="目录"	
	elif [ -f "$file" ]; then
		#文件
		typeDoc="文档"
	else
		#其他
		typeDoc="其他文件"
	fi
	#文件权限
	perm=""
	test -r "$file" && perm="${perm}可读" || perm="${perm}不可读"
	test -w "$file" && perm="${perm} 可写" || perm="${perm} 不可写"
	test -x "$file" && perm="${perm} 可执行" || perm="${perm} 不可执行"
	echo -e "${typeDoc} $file 的权限：\t${perm}"
}

read -p "请输入一个目录：" dir
#检测目录
if [ ! -d "$dir" ]; then
	_help;
fi
dir=${dir%/}

#对目录下文档逐一检查
for doc in $(ls "$dir")
do
	_check $doc;
done

