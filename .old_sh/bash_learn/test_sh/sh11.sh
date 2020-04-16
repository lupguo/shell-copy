#!/bin/bash
#Program 
#	该程序主要用于侦测是否开启了WWW、SSH、ftp
#Version 1.0
#

echo "-----------------------------------------------------------"
echo "检测服务开启状态"
echo "注意点："
echo "	1.!取否的操作符号也要有空格，如! -z, ! -f..."
echo "-----------------------------------------------------------"

#1.网络监听状态
#www服务
if [ ! -z "$(netstat -tunl|grep ":80 ")" ];then
	echo "系统开启了WWW服务...."
fi
#ssh服务
if [ ! -z "$(netstat -tunl|grep ":22 ")" ];then
	echo "系统开启了SSH服务...."
fi
#ftp服务
if [ ! -z "$(netstat -tunl|grep ":21 ")" ];then
	echo "系统开启了FTP服务...."
fi
exit 0
