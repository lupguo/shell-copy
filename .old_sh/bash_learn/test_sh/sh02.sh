#!/bin/bash
#Program:
#	User inputs his first name and lastname.Program shows his full name.
#History:
#	2015/4/28
#Version: 1.0
#
PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin
export PATH

read -p "Please input your first name:" firstname	#提示用户输入第一个名字
read -p "Please input your last name:" lastname
echo -e "Your full name is:$firstname $lastname"
