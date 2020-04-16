#!/bin/bash
#ScriptName:	loop3.sh
#Purpose:
#	For循环的利用,seq的利用
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/29 22:03:17
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

progress=
declare -i num=9
for row in $(seq 1 "$((($num+1)/2))")
do
	#前置空格数
	spaceNums=$((($num-$row)/2)) #空格数
	for i in $(seq 1 $spaceNums)
	do
		echo -n "|"
	done

	#开始输出指定的*号数
	starNums=$(($row*2-1))
	for col in $(seq 1 "$starNums")
	do
		echo -n "*"	
	done
	echo -ne "\n"	
	#暂停一秒
	#sleep 1
done

 

