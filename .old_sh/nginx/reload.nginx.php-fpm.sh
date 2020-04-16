#!/bin/bash

PATH=/bin:/sbin
export PATH

#php相关
php_path=/usr/local/php7
php_fpm_exec=${php_path}/sbin/php-fpm
php_pid_file=${php_path}/log/php-fpm.pid
php_ini_file=${php_path}/etc/php.ini

#nginx相关
nginx_path=/usr/local/nginx
nginx_exec=${nginx_path}/sbin/nginx
nginx_pid_file=/var/run/nginx.pid
nginx_conf_file=${nginx_path}/conf/nginx.conf

#get pid
get_pid (){
    case $1 in 
	"php")
	    pid=`cat $php_pid_file`
    	;;
    	"nginx")
	    pid=`cat $nginx_pid_file`
    	;;
    esac
    echo $pid
}

#print line
print_hr (){
    echo '--------------------------------------------------------------------------------'
}

#reload php
php_fpm_reload (){
    old_pid=$(get_pid php)
    echo "php-fpm old running master pid:[${old_pid}], killing now..."
    /bin/kill -15 $old_pid && $php_fpm_exec -c $php_ini_file
    ret=$?
    if [ ! 0 -eq $ret ]; then
        echo "php-fpm restart fail : $ret"
        exit $ret
    else
        echo "php-fpm new running master pid:[$(get_pid php)]" 
    fi  
}

#start nginx
nginx_start() {
    $nginx_exec -c $nginx_conf_file;
    if [ "$?" -ne 0 ];  then
	echo "nginx start failed...." && exit 104
    fi
}

#stop nginx
nginx_stop(){
    nginx_pid=$(get_pid nginx)
    if [ "$nginx_pid" -gt 0 ]; then
	echo "old nginx running pid:[$nginx_pid], killing now..."
	$nginx_exec -s quit
    	if [ "$?" -ne 0 ];  then
	    echo "nginx stop failed..." && exit 103
    	fi
    else
	echo "nginx pid cannot get...."
	exit 101
    fi
}

#test nginx config
nginx_test() {
    $nginx_exec -t
}

#reload nginx
nginx_reload (){
    nginx_test

    nginx_stop

    nginx_start

    echo "new nginx running pid:[$(get_pid nginx)]"
}

#how we call
case "$1" in
    "all")
	php_fpm_reload	
	print_hr
	nginx_reload
    ;;

    "php-fpm")
	php_fpm_reload
    ;;

    "nginx")
	nginx_reload
    ;;
   
    *)
	echo "Usage $0 {all|php-fpm|nginx}"
    ;;
esac

exit $?
