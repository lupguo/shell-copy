#!/bin/bash
#ScriptName:	parm.sh
#Purpose:
#	该脚本主要为了验证shell script的输入参数相关
#	$0:脚本档名 $1,$2....脚本后面接的参数
#	其余隐藏参数信息：
#		$#:脚本后面共有多少参数
#		$@:参数["$1","$2",..."$n"]，参数用引号引起来，并且归组
#		$*:$1 $2 ... $n	
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27 18:00:45
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#检测档名参数
[ "$#" -eq 0 ] && echo "档名后面未带任何参数！" && exit 0;
[ "$#" -lt 2 ] && echo "档名后面携带的参数不能少于两个！" && exit 0;
#参数信息
echo -n "$0 后面共有 $# 个参数:"
echo "参数1：$1,参数2：$2"

