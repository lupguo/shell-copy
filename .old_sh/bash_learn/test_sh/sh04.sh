#!/bin/bash
#Program:
#	要求用户输入两个参数，计算参数的积
#Date:
#Version:
#

#1.要求用户输入两个参数
echo "--------------------------"
echo "计算用户输入的两个参数的积"
echo "--------------------------"
read -p "请输入数1:" num1
read -p "请输入数2:" num2

#2.申明整型变量
declare -i amass=$num1*$num2	#还一种方法是通过$(($num1*$num2))
#3.输出积
echo "$num1 * $num2 = $amass "
exit 0

