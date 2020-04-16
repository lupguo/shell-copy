#!/bin/bash
#ScriptName:	loop2.sh
#Purpose:
#	求阶乘！		
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/29 21:39:26
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH


read -p "请输入一个正整数：" num

#检测用户输入的数据
test=$(echo "$num"|grep -E "[1-9][0-9]*")
if [ -z "$test" ]; then
	echo "格式错误！" && $0 && exit
fi

#数据ok
declare -i sum=0
declare -i n=1
while [ $num -ge $n ]
do
	sum=$sum+$n
	n=$n+1
done

echo "1+2+3+...+$num的和为：$sum"
