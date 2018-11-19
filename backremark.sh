#!/bin/bash
# Purpose:	解决remark日志备份问题，仅保留目录中一份备份副本
#
# 存储路径：/etc/cron.daily/backremark.sh
# 
# 

PATH=/bin:/usr/bin
export PATH

#[/home/Terry]需要备份的目录文件
storeDir='/backups/terry'	#备份存储目录
tarname="bak-$(date '+%Y%m%d%H%M').tar.gz"	#备份名称

#打包备份
cd /home && tar -zcf "$storeDir/$tarname" "Terry" && echo '备份结束！' > /dev/null 

#检测文件夹下的目录文件数
fileNums=$(($(ls -l $storeDir|wc -l)-1))

#echo "${storeDir}目录下共计有${fileNums}个文件" 
if [ -f "$storeDir/$tarname" ] && [ $fileNums -gt 1 ]; then
	cd $storeDir && rm $(ls|grep -v $(ls -lt|sed -n '2p'|tr -s ' ' ' '|cut -d ' ' -f 9)) && exit 0
fi
