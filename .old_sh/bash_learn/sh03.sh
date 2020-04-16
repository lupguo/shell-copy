#!/bin/bash
#ScriptName:	sh04.sh
#Purpose:
#	该脚本主要测试数字运算$((计算式))	
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27 16:21:14
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

read -p "输入第一个数：" num1
read -p "输入第二个数：" num2
declare -i multi
multi=$num1*$num2 
sum=$(($num1+$num2))
div=$(($num1/$num2))
echo "$num1 * $num2 = $multi"
echo "$num1 + $num2 = $sum"
echo "$num1 / $num2 = $div"
