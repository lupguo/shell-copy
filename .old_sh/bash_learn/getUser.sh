#!/bin/bash
#
#Purpose:
#	从文件中获取用户名
#
#

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

bk_path=$(pwd)
bkdb_conf=${bk_path}/db.conf
for user in $(cat $bkdb_conf|grep -vE '(^$)|(^#)') 
do
	echo $user
done

exit 0
