#!/bin/bash
#ScriptName:	serverSimulate.sh
#Purpose:
#	该Shell Script主要为了模拟一个服务的启动、暂时、重启、状态获取	
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/29 10:00:05
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#通过case 来进行处理多种参数情况
case "$1" in
	"start")
		echo "模拟开启某个服务..."		
		#检测服务程序的PID是否存在！
		if [ -z "$PID" ]; then
			echo "某服务开启失败，失败原因:系统负载过高！"	
		else
			echo "某启动成功！程序pid:$PID!"
		fi
	;;

	"stop")
		echo "暂停某服务...."
		echo "服务暂停完成!"
	;;

	"status")
		#检测服务程序PID是否存在
		echo "检测程序PID是否存在..."
		echo "某服务正在运行..."		
	;;	

	*)
		echo "$0 start|stop|status"
	;;
esac



