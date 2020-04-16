#!/bin/bash
#Purpose:
#	Sh2:输入一个文件名，通过touch生成2个文件
#History:
#Special:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27

PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH

read -p "请输入一个文件名：" filename
curtime=$(date '+%Y%m%d%H%M%S');
file1="${filename}_${curtime}";
touch $file1;
yesterday=$(date '+%Y%m%d%H%M%S' -d '-1 days');
file2="${filename}_${yesterday}";
touch $file2;
echo '你创建了两个文件：'
echo "${file1} ${file2}"
