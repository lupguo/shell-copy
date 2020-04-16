#!/bin/bash
#Prgoram
#	让用户输入HELLO，如果输入的不是HELLO/hello那么一直提示用户输入，否则提示用户，HELLO，HOW ARE YOU!
#Version 1.0

read -p "请输入hello:" word

if [ "$word" != "hello" ] && [ "$word" != "HELLO" ]; then
	sh $0
else
	echo "Hello,How are you!!" && exit 0
fi
