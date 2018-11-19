#!/bin/bash
#ScriptName:	
#Purpose:
#	该脚本主要用于解决数据库备份问题
#	大体流程：
#		指定需要备份的库名、host、username、password
#History:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2015/01/15 00:20:02
#Special:

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

root_path=/root/sh/mysql
backup_db=${root_path}/backup_db.conf
mysql_conf=${root_path}/backup_mysql.conf
dump_exec=/usr/bin/mysqldump

#存储备份的位置以及文件
store_path=/tkstorm/tk_sub/backup/mysql
suffix=`date "+%H%M%S"`
back_file=${store_path}/`date "+%Y%m"`/`date "+%d"`/tkstorm_blog.${suffix}.sql

#检测backup_db.conf文件是否存在
ck_conf_file(){
	if [ ! -e "$backup_db" ]; then
		echo "[error] ${backup_db} 备份数据库配置文件不存在!" && exit 100
	elif [ ! -e "$mysql_conf" ]; then
		echo "[error] ${mysql_conf} Mysql配置文件不存在!" && exit 101
	fi
}
ck_conf_file;

#备份目录检测
[ ! -d "$back_file" ] && mkdir -p `dirname $back_file`

#执行备份
databases=`cat $backup_db`
if [ -z "$databases" ]; then
	echo "[error] ${backup_db} 备份配置数据库为空!" && exit 102
fi

$dump_exec --databases $databases > $back_file

echo "dump database done.." && exit 0
