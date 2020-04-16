#!/bin/bash
#ScriptName:	calcBirthDay.sh
#Purpose:
#	输入一个日期，看是否已过期，若未过期显示剩余时间！	
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27 23:50:35
#Special:
#	grep -E "^([0-9]{2}|[0-9]{4})\/[0-9]{1,2}\/[0-9]{1,2}$" grep 正则部分无需加边界符合，在正则内部不支持\d等转义

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#获取日期
if [ -z "$1" ]; then
	read -p "请输入一个生日日期：" birthDay
else 
	birthDay="$1"
fi

#检验日期格式是否标准
checkRs=$(echo "$birthDay"|grep -E "^([0-9]{2}|[0-9]{4})\/[0-9]{1,2}\/[0-9]{1,2}$")
if [ -z "$checkRs" ]; then
	echo "日期格式错误，请重新输入，例如1988/01/18！" 
	$0 && exit 0
fi

curTimeStamp=$(date '+%s' -d "$(date '+%Y-%m-%d')")
torTimeStamp=$(date '+%s' -d "$(date '+%Y-%m-%d' -d '+1 day')")
birTimeStamp=$(date '+%s' -d "$birthDay")
if [ $curTimeStamp -gt $birTimeStamp ]; then
	echo "今年的生日已经过完了！"
elif [ $torTimeStamp -le $birTimeStamp ]; then
	leftDays=$((($birTimeStamp-$torTimeStamp)/(3600*24)))
	if [ $leftDays -gt 0 ]; then
		echo "距离生日还有$leftDays天！"
	else 
		echo "明天你过生日！"
	fi
else
	echo "生日快乐！"
fi
