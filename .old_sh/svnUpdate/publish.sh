#!/bin/bash
#Program：
#	本程序注意用于更新五洲会预发布代码到线上环境！
#
#History:
#	2015/11/3	Terry

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH


#part1:预定义变量设置
PC_REPO='/var/www/www.wzhouhui.com'
M_REPO='/var/www/m.wzhouhui.com'


#part2:仓库选择
svn_lib="$1"
until [ "$svn_lib" == "pc" -o "$svn_lib" == "m" ]
do
	read -p '代码发布，选择要发布的SVN库m、pc：' svn_lib
done

case "$svn_lib" in

	"pc")
		echo '----------------------------------------------'
		echo '【PC版预发布】 => www.wzhouhui.com'
		echo '----------------------------------------------'
		SVN_REPO=$PC_REPO

	;;

	"m")
		echo '----------------------------------------------'
		echo '【M版预发布】 => m.wzhouhui.com'
		echo '----------------------------------------------'
		SVN_REPO=$M_REPO

	;;

esac

#part3:更新仓库
tmp_file='/tmp/svn_upd.log'
svn up $SVN_REPO|tee $tmp_file


#rm -f $tmp_file







