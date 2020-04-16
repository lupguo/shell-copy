#!/bin/bash
#Program:	 sh15.sh
#Version:	1.0
#Date:		2015/4/29
#Purpose:
#	熟悉SHELL SCRIPT的循环知识点
#	while [ condition ] do... done
#	until [ condition ] do... done
#	

echo "---------------------------------------------------"
echo "SHELL 循环相关"
echo "---------------------------------------------------"

# 获取用户输入数据
getInput(){
	echo "请输入项测试的循环:"
	echo "	1:while...do...done"
	echo "	2:until...do...done"
	echo "	3:for循环版本1"
	echo "	4:for循环版本2"
	read loopChoice
	if [ -z "$loopChoice" ];then
		getInput
	fi
}

# 循环方法测试定义
loop_while(){
	echo "while...do...done循环案例:"
	i=1
	while [ $i -le 10 ]
	do
		echo "$i*$i=$(($i*$i))"	
		i=$((i+1))
	done
	echo
}

loop_until(){
	echo "until...do....done循环案例:"
	i=1
	until [ $i -gt 10 ]
	do
		echo "$i*$i*$i=$(($i*$i*$i))"
		i=$((i+1))
	done
}

loop_for(){
	echo "for循环测试,找出uid>200的账户信息"
	users=$(awk -F: '$3>200 {print $1}' /etc/passwd)
	for user in $users
	do
		id $user
	done
}

loop_for2(){
	echo 'for循环的for ((i=1; i< 10; i++))版本：'
	declare -i n
	read -p '输入求和等差数列最后项n:' n
	if [ "$n" -le 1 ]; then
		echo 'n的值太小了！' && loop_for2;
		exit
	fi

	#求1~n的和
	sum=0
	for ((i=1; i< "$n" ; i++))
	do
		sum=$(($sum + $i))
	done
	echo "1~$n的和为：" $sum
}

#用户选择
[ $# -ne 0 ] && loopChoice="$1" || getInput

#循环选择
loop_run(){
	case "$loopChoice" in
		"1")
			loop_while
		;;
		"2")
			loop_until
		;;
		"3")
			loop_for
		;;
		"4")
			loop_for2
		;;
		*)
			getInput
			loop_run
		;;
	esac
}
loop_run
