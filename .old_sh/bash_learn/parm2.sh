#!/bin/bash
#ScriptName:	parm2.sh
#Purpose:
#	该文档主要测试传递到shell script中的参数被shift操作后的移除过程！	
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27 18:11:58
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

[ "$#" -lt 3 ] && echo "传递给script的参数至少需要3个." && exit 0;

echo "$0 $* 传递了 $# 个参数:$*"
echo "进行[shift]操作！"
shift
echo "当前参数情况：$*"
echo "进行[shift 2]操作！"
shift 2
echo "当前参数情况：$*"
echo "\$#=$#,\$@=$@,\$0=$0,\$1=$1,\$2=$2"

