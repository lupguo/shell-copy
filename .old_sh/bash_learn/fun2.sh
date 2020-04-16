#!/bin/bash
#ScriptName:	fun2.sh
#Purpose:
#	测试函数调用，返回值相关		
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/29 13:32:30
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#print $?
printMark(){
	echo "\$?=$?"
}

#fun1 printf
#fun1(){
#	echo  'hello,world!';
#}
#fun1;
#echo "\$?=$?"

#fun2 
fun2(){
	return $1;	
}

sval1=$1
sval2=$2
`fun2 "$sval1" "$sval2"`;
printMark;

