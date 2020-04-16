#!/bin/bash

#nginx setting
nginx_conf=/usr/local/nginx/conf/nginx.conf
nginx_pid=/var/run/nginx.pid

#php setting
php_ini=/usr/local/php7/etc/php.ini
php_conf=/usr/local/php7/etc/php-fpm.conf
php_pid=/var/run/php-fpm.pid

# cli msg
function cli_msg(){
    printf "[*]%s\n" "$1"
}

# 服务已启动
function ck_server(){
    case $1 in 
	"nginx")
	    test -f $nginx_pid
	;;

	"php")
	    test -f $php_pid
	;;
    esac
    return $?
}

# 启动
function ws_start(){
    cli_msg "start web server..."
    
    #php start
    ck_server php
    if [ "$?" != "0" ]; then
	sudo php-fpm -c $php_ini -y $php_conf && cli_msg "[php-fpm] start ok."
    else
	pid=$(cat $php_pid)
	cli_msg "[php-fpm] $pid is running..."
    fi

    #nginx start
    ck_server nginx
    if [ "$?" != "0" ]; then
	sudo nginx -c $nginx_conf && cli_msg "[nginx] start ok."
    else
	pid=$(cat $nginx_pid)
	cli_msg "[nginx] $pid is running..."
    fi
}

# 停止
function ws_stop(){
    cli_msg "stop web server..."

    #php stop
    ck_server php
    if [ "$?" == "0" ]; then
    	sudo kill -s SIGTERM $(cat $php_pid) && cli_msg "[php-fpm] stopped."
    else
	cli_msg "[php-fpm] stop failure, php-fpm server maybe not running."
    fi

    #nginx stop
    ck_server nginx
    if [ "$?" == "0" ]; then
   	sudo nginx -s quit && cli_msg "[nginx] stopped."
    else
	cli_msg "[nginx] stop failure, nginx server maybe not running."
    fi
}

# 重启
function ws_restart(){
    cli_msg "restart web server [php+nginx]..."
    ws_stop &> /dev/null
    sleep 1
    ws_start
}

case $1 in 

    "start")
	ws_start
    ;;

    "stop")
	ws_stop
    ;;

    "restart")
	ws_restart
    ;;

    *)
	cli_msg "Using $0 {start|stop|restart}"
    ;;
esac
