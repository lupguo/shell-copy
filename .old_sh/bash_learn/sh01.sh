#!/bin/bash
#Purpose:	
#	学习Bash
#History:
#Special:
#Version:	1.0.0
#Author:	TKstrom
#Email:		tkstrom@163.com
#Date:		2014/12/27

PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH

read -p "Input your first name:" firstName
read -p "Input your last name:" lastName
echo -e "You Name:${firstName} ${lastName}!"
