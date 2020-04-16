#!/bin/bash
#ScriptName:	condition.sh
#Purpose:
#	条件判断的检测			
#	if [ -z $a ]; then
#		....
#	fi
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27 18:23:51
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#if
if [ "$#" -eq 0 ]; then
	echo "档名后面未带任何参数！";
else
	echo "$0 $* 共附带了$#个参数！";
fi

#if else
declare -i num;
read -p "输入一个0~100的数字：" num;
if [ "$num" -lt 0 ] || [ "$num" -gt 100 ]; then
	echo "输入的数据超出了0~100的范围！" && exit 0;
fi

if [ "$num" -lt 50 ]; then
	echo "输入数小于50";
elif [ "$num" -eq 50 ]; then
	echo "输入数等于50";
else 
	echo "输入数大于50";
fi

