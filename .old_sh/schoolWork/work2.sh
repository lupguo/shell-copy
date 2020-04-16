#!/bin/bash
#Program	work2.sh
#Version	1.0
#Date		2015/4/30
#Purpose
#	按格式输入日期，计算还有多少天生日

echo "--------------------------------------"
echo "计算还有多少天过生日！"
echo "注意点:"
echo "	1.if...elif..fi,不是elseif"
echo "--------------------------------------"



inputCheck(){
	if [ $# -gt 0 ];then
		birthday="$1"
		date -d "$birthday" "+%m%d" &> /dev/null && inCheck=1 || inCheck=0
	fi
	while [ "$inCheck" != 1 ]
	do
		read -p "请输入您的生日(Exp:1988/03/15)" birthday
		date -d "$birthday" "+%m%d" &> /dev/null && inCheck=1 || inCheck=0
	done
}

# 用户输入检测
[ $# -gt 0 ] && inputCheck "$1" || inputCheck

# 日期换算
nowYear=$(date +%Y)
birthMD=$(date -d "$birthday" "+%m%d")	#生日日期月日
nowMD=$(date +%m%d)	#今天月日	

if [ "$nowMD" -eq "$birthMD" ];then
	echo "今天您过生日，生日快乐！"
elif [ "$nowMD" -gt "$birthMD" ]; then
	echo "您今年的生日已经过完了！"
else
	stmpBirth=$(date -d "${nowYear}$birthMD" +%s)	#生日日期时间戳
	stmpNow=$(date -d "${nowYear}$nowMD" +%s)	#现在时间戳
	leftDay=$((($stmpBirth-$stmpNow)/(3600*24)))	
	echo "距离您生日还有$leftDay天..."
fi

exit 0

