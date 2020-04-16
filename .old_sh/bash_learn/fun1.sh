#!/bin/bash
#ScriptName:	fun1.sh
#Purpose:
#	初学函数功能	
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/29 10:39:13
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

function printHello(){
	echo "Hello,World!!"
	echo "\$#=$#,\$*=$*,\$@=$@"
	echo "\$0=$0,\$1=$1,\$2=$2"
}

printHello 1 2 
