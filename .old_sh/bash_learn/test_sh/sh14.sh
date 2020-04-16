#!/bin/bash
#Program:	sh14.sh
#Date:		2015/4/29
#Version:	1.0
#Purpose:	
#	熟悉SHELL函数用法，用户输入小写的one、two、three，将其大写，并打印

echo "--------------------------------------------------------------------------------"
echo "熟悉函数用法:"
echo "	注意点："
echo "	1.函数一定要在使用之前定义"
echo "	2.函数调用时候，不需要加括号，后面直接接参数"
echo "	3.函数也拥有内建变量:$0>函数名称 $1,$2...传递给函数的相应变量"
echo "	4.SHELL SCRIPT的内建变量$#>参数个数 $@>一个一个单个参数 $*>一个参数字符合并"
echo "	5.函数function关键词不是必须的"	
echo "	6.可以通过输出echo来换行"
echo "--------------------------------------------------------------------------------"

#1.定义printit函数
function print1(){
	echo -n "Print1 Fun..."
}

#1.2定义二号打印函数print2来接受用户参数
print2(){
	echo "传递给print2参数个数:$#，参数系列：$*"
	echo "Print2 Fun >>>>>>> $1"
}

#2.定义获取用户选择的函数
getChoice(){
	read -p "请输入您的选中(1、2、3、4)：" choice
}

#3.获取用户选择
if [ $# -eq 0 ]; then
	getChoice
else
	choice="$1"
fi

#4.根据用户选择做出对应的分支处理
dealChoice(){
	case "$choice" in
		"1")
			print1;
			echo "ONE"
		;;
		"2")
			print1;
			echo "TWO"
		;;
		"3")
			print2 THREE
		;;
		"4")
			print2 "FOUR"
		;;
		*)
			echo -n "输入参数错误，" 
			getChoice; 
			dealChoice;
		;;
	esac
}
dealChoice;
exit 0

