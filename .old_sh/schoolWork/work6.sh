#!/bin/bash
#Program	work6.sh
#Version	1.0
#Date		2015/4/30
#Author		Terry
#Purpose
#	文件内容操作，找出/etc/passwd下的第一列账户信息，并按格式输出

accountFile=/etc/passwd

i=1
for account in $(cat $accountFile|cut -d ':' -f1)
do
	echo "第${i}个账户是：${account}!"
	i=$((++i))
done


