#!/bin/bash
#Program
#	让用户输入一个日期，计算离这个日期还有多久！
#Version

echo '----------------------------------------------------------------'
echo '注意点:'
echo '	1.linux的date与php或mysql中的时间格式化有些许差异，'
echo 'Linux 年月日时分秒是date("+%Y-%m-%d %H:%M:%S")，'
echo '而php中的是date("Y-m-d H:i:s")'
echo '----------------------------------------------------------------'



read -p "输入您的生日日期(1988-01-18)：" birthday

#1.检测用户输入数据
if [ -z "$birthday" ]; then
	echo '请输入正确的生日格式!' && sh $0 && exit 1
fi

birthday=$(date -d "$birthday" "+%Y-%m-%d")
if [ ! $(echo "$birthday"|grep -oE "^[0-9]{4}-[0-9]{2}-[0-9]{2}$" ) ];then
	echo "生日格式错误！!" && sh $0 && exit 1
fi

#2.当前时间
curYear=$(date "+%Y")			#当今年份
curYearBirthday="$curYear-"$(date -d "$birthday" "+%m-%d")	#今年生日日期
echo "今年生日日期：$curYearBirthday"
sec1=$(date "+%s")				#当前时间戳
sec2=$(date -d $curYearBirthday "+%s")		#今年生日开始时间戳
sec3=$(date -d "$curYearBirthday + 1day" "+%s")	#今年生日截止时间戳

if [ "$sec1" -lt "$sec2" ];then
	leftSecs=$((($sec2 - $sec1)/(3600*24)+1))
	echo "距离您您生日还有$leftSecs天"
elif [ "$sec1" -gt "$sec3" ];then
		echo "您生日已经过了！！"
else
	echo "祝您生日快乐！"
fi
exit 0 ;
