#!/bin/bash
#Program	work3.sh
#Version	1.0
#Date		2015/4/30
#Author		Terry
#Purpose
#	输入一个数n，求1!+2!+....n!

echo "--------------------------------------------------"
echo "输入一个数，求其阶乘之和！"
echo "注意点："
echo "	1.做正则判断时候grep -q出来的结果有匹配和不匹配之分，匹配返回exit状态0，该状态不可直接用于条件判断之中！"
echo "	2.shell script中的申明的变量时全局性的，函数内的变更会带到函数之外来！"
echo "--------------------------------------------------"

# N参数检测函数
nCheck(){
	if [ $# -gt 0 ]; then	#用户有附带命令参数
		if [ $(echo $1|grep -qE "^[0-9]{1,333}$" && echo 0 || echo 1) == 1 ];then
			iError=1
			echo -n "输入的参数N有误！"	
		elif [ "$1" -gt 100 ];then
			iError=1
			echo -n "输入的N数字太大！"

		elif [ "$1" -lt 1 ];then
			iError=1
			echo -n "输入的N应该太小！"
		else
			iError=0
			n=$1
		fi
	fi
}


# 用户命令附带参数时候检测
[ $# -gt 0 ] && nCheck $1

# 验证参数N是否有误，有误则继续提示用户让其输入正确的N
until [ "$iError" == 0 ]
do
	read -p "请输入一个1~100的数字N:" n
	nCheck $n
done

# 阶乘函数
factorialSum(){
	n=$1
	sum=0
	if [ "$n" == 0 ];then
		echo "0!=1"
	else
		for i in $(seq 1 $n)
		do
			fact=1	
			for j in $(seq 1 $i)
			do
				fact=$(($j*$fact))
			done
			sum=$(($fact+$sum))
		done
		echo "1!+2!+...${n}!=${sum}"
	fi
}

factorialSum $n


