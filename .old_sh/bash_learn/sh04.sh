#!/bin/bash
#ScriptName:	sh04.sh
#Purpose:
#	测试test判断符，检测输入的文件是否存在，并且判断输入的文件是文件还是目录，
#	判断当前用户对该文件的权限，并输出权限数据		
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27 17:28:45
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

read -p "输入一个文件或者目录的名称：" fileName
#检测文件名
test -z $fileName && echo  "未输入任何信息！" &&  exit 0;
#检测文件是否存在
test -e $fileName && echo "文件存在！" || echo "文件不存在！";
test ! -e $fileName && exit 0;

#检测文件类型
echo -n "文件类型："
test -f $fileName && echo "属于文件."
test -d $fileName && echo  "属于目录."
#检测读写权限
echo "当前用户权限："
test -w $fileName && echo -n "可写！"
test -r $fileName && echo -n  "可读！"
test -x $fileName && echo  "可执行！"
#显示文件属性
test -f $fileName && ls -al $fileName
test -d $fileName && ls -ald $fileName

