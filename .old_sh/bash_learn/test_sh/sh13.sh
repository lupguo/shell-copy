#!/bin/bash
#Program	sh13.sh
#Date:		2015/4/29
#Purpose:	
#	熟悉case语法，让用户输入1,2,3，对应输出其英文
#

echo "---------------------------------"
echo "熟悉case语法"
echo "	注意点："
echo "	1.case中变量带引号;"
echo "	2.最后通用默认情况*不要加引号"
echo "---------------------------------"

#1.参数检测
if [ $# -eq 0 ]; then
	read -p "请输入一个数字(1、2、3):" num
else
	num="$1"
fi

case "$num" in
	"1")
		echo "你输入了数字1:ONE"
		;;
	"2")
		echo "你输入了数字2:TWO"
		;;
	"3")
		echo "你输入了数字3:THREE"
		;;
	*)
		echo "数字输入错误!" && sh $0
		;;
esac
exit 0
