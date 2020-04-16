#!/bin/bash
#Program:
#	让用户输入一个Y/N或者y/n，并提示相应的结果
#Date:
#Version:

echo "-------------------------------------"
echo "一个Y/N的提示结果信息"
echo "-------------------------------------"

#1.提示用户输入内容
read -p "请输入Y/N:" input

#2.检测用户输入信息
[ -z "$input" ] && echo "没有输入任何东西" && exit 1
[ "$input" == "Y" -o "$input" == "y" ] && echo "Yes，你选择了同意." && exit 0
[ "$input" == "N" -o "$input" == "n" ] && echo "No，你选择了不同意." && exit 0

echo -E "输入的内容信息错误!" && exit 1


