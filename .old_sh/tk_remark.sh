#!/bin/bash
#ScriptName:	remark.sh
#Purpose:
#	主要用于记录笔记，调用该脚本，将调用/home/Terry/sh/reamrk.txt文件，
#	并且再原有文档上面增加时间！		
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/28 00:55:53
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#帮助文档
_help(){
	echo "-----------------------------------------------------------------------------"
	echo "remark.sh主要用于记录日常备注信息，比如学习札记等。"
	echo "后面带-t参数的话，会记录为当前的时间，不带参数是直接调用vim编辑器打开文档！"
	echo "如果没有指定打开的文件，将打开默认位于/home/Terry/remark/remark.txt文件！"
	echo "-----------------------------------------------------------------------------"
	exit 0
}
#获取星期函数
getChineseWeek(){
	lWeek=
	case "$(date '+%w')" in
	"0")
		lWeek="天"	
	;;
	"1")
		lWeek="一 "	
	;;
	"2")
		lWeek="二"	
	;;
	"3")
		lWeek="三"	
	;;
	"4")
		lWeek="四"	
	;;
	"5")
		lWeek="五"	
	;;
	"6")
		lWeek="六"	
	;;
	esac
	echo "星期${lWeek}"
}

#是否展示帮助内容
if [ "$1" == '-h' -o "$1" == '--help' ]; then
	_help;
fi

#默认打开的备份文件
defRemarkFile=/home/Terry/remark/remark.txt
if [ "$1" != '-t' ]; then
	remarkFile=${1:-"$defRemarkFile"}
else	
	curTime="$(date '+%Y/%m/%d %H:%M:%S') $(getChineseWeek)"
	remarkFile=${2:-"$defRemarkFile"}
	echo "############################################" >> $remarkFile	
	echo -e "\t$curTime" >> $remarkFile
	echo "############################################" >> $remarkFile
fi
vim $remarkFile
exit 0
