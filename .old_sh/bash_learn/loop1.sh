#!/bin/bash
#ScriptName:	loop1.sh
#Purpose:
#	熟悉Shell中的循环		
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/29 10:50:35
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#检测是否为整数函数
function isInt(){
	ck=$(echo "$1"|grep -E "^[1-9][0-9]*$")
	if [ -z "$ck" ]; then
		return 0
	else
		return 1
	fi
}

#while循环
read -p "输入一个正整数：" num
checkRs=`isInt "$num";echo $?`
while [ "$checkRs" == 0 ] || [ "$num" -lt 0 ]
do
	#检测用户输入的数据，看是否为正整数，若不为正整数，继续提升用户，重新输入！
	read -p "你输入的不是一个正整数，请重新输入：" num
	checkRs=`isInt "$num";echo $?`
done

echo "你输入了一个正整数：$num"



