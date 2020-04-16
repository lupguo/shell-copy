#!/bin/bash
#Program 	sh16.sh
#Version	1.0
#Date		2015/4/29
#Purpose
#	测试内网IP信息，熟悉seq序号打印命令，以及和for循环的结合使用
#

# 网域ID
netId="192.168.10.0"

# 测试1~255号主机开机情况
for host in $(seq 1 255)
do
	ip="$(echo $netId|cut -d '.' -f1-3).${host}"		#ip地址
	ping -c 1 -w 1 $ip &> /dev/null && pingRs=1 || pingRs=0 #ping的结果
	if [ $pingRs == '1' ];then
		echo "Server Ip:$ip is UP..."
	else
		echo "Server Ip:$ip Is Down..."
	fi	
done
exit 0
