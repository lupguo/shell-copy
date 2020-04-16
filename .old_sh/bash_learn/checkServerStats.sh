#!/bin/bash
#ScriptName:	checkServerStats.sh
#Purpose:
#	通过端口检测服务器开启状态，若没有传递参数，则检测下面默认的端口		
#	www:80
#	ftp:21
#	ssh:22
#	email:25
#	mysql:3306
#	redis:6379
#	elasticsearch:9200-9300
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27 23:22:40
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

stats=$(netstat -tnl|grep ':80')	#检测www
if [ "$stats" != "" ]; then
	echo "WWW服务已开启！"
else
	echo "WWW服务未开启！"
fi

stats=$(netstat -tnl|grep ':21')	#检测ftp
if [ ! -z "$stats" ]; then
	echo "FTP服务已开启！"
else
	echo "FTP服务未开启！"
fi


stats=$(netstat -tnl|grep ':22')	#检测ssh
if [ ! -z "$stats" ]; then
	echo "SSH服务已开启！"
else
	echo "SSH服务未开启！"
fi


stats=$(netstat -tnl|grep ':6379')	#检测redis
if [ ! -z "$stats" ]; then
	echo "REDIS服务已开启！"
else
	echo "REDIS服务未开启！"
fi
