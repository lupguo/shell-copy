#!/bin/bash
#
# Description:
#   Reload php-fpm and nginx shell
#
# Date: 2016/12/20
#

PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH

#php相关
php_path=/usr/local/php7.1
php_fpm_sbin="${php_path}/sbin/php-fpm -c ${php_path}/etc/php-fpm.conf"

#nginx相关
nginx_path=/usr/local/nginx
nginx_sbin="${nginx_path}/sbin/nginx -c ${nginx_path}/conf/nginx.conf"

#pid相关
php_fpm_pid=/var/run/php-fpm.pid
nginx_pid=/var/run/nginx.pid

#get pid
get_pid (){
    case $1 in 
	"php-fpm")
	    pid=`cat $php_fpm_pid`
    	;;
    	"nginx")
	    pid=`cat $nginx_pid`
    	;;
    esac
    echo $pid
}

#print line
print_hr (){
    for i in $(seq 1 100);
    do
    	echo -n '-';
    done;
    echo
}

#test php-fpm configure file
test_phpfpm_configure(){
   $php_fpm_sbin -t; 
}

#stop php-fpm
stop_phpfpm(){
    echo "Stop php-fpm..."
    if [ ! -f "$php_fpm_pid" ]; then
         echo "[failed]php-fpm pid file not exist!";
         return 0;
    fi
    PHPFPM_PID=$(get_pid php-fpm)
    kill -15 $PHPFPM_PID
    if [ "$?" -ne 0 ]; then
	echo "[failed]stop php-fpm failed!"
    else
	echo "Stop php-fpm success."
    fi 
}

#start php-fpm
start_phpfpm(){
    echo "Strat php-fpm..."
    test_phpfpm_configure

    $php_fpm_sbin 
    if [ "$?" -ne 0 ]; then
	echo "[falied]start php-fpm failed!" && exit 500
    fi
    PHPFPM_PID=$(get_pid php-fpm)
    echo "Php-fpm[${PHPFPM_PID}] is running..."
}

#reload php-fpm
reload_phpfpm(){
    stop_phpfpm
    start_phpfpm    
}

# ---------------------------------------------------------
#start nginx
start_nginx() {
    echo "Start nginx..."

    test_nginx

    $nginx_sbin;
    if [ "$?" -ne 0 ]; then
	echo "nginx start failed...." && exit 500
    fi
    NGINX_PID=$(get_pid nginx)
    echo "nginx[${NGINX_PID}] is running..."
}

#stop nginx
stop_nginx(){
    if [ ! -f "$nginx_pid" ]; then
	echo "[warning] nginx is not running...";
	return 0;
    fi
    NGINX_PID=$(get_pid nginx)
    if [ ! -z "${NGINX_PID}" ]; then
	echo "nginx running pid:[${NGINX_PID}], killing now..."
	$nginx_sbin -s quit
    	if [ "$?" -ne 0 ];  then
	    echo "[failed] nginx stop failed..." && exit 500
    	fi
    else
	echo "[failed] nginx pid cannot get...." && exit 500
    fi
}

#test nginx
test_nginx() {
    $nginx_sbin -t
}

#reload nginx
reload_nginx (){
    stop_nginx
    start_nginx
}

#how we call
case "$1" in
    "all")
	reload_phpfpm	
	print_hr
	reload_nginx
    ;;

    "php-fpm")
	reload_phpfpm
    ;;

    "nginx")
	reload_nginx
    ;;
   
    *)
	echo "Usage $0 {all|php-fpm|nginx}"
    ;;
esac

exit $?
