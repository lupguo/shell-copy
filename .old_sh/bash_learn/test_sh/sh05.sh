#!/bin/bash
#Program:
#	让用户输入一个文档名称，判断文件存在与否，以及该文档时目录还是文件，并检测目录权限
#Date:
#	2015/4/28
#Version: 1
#

echo "-------------------------------------"
echo "检测用户输入的文档内容信息"
echo "-------------------------------------"

#1.让用户输入内容
read -p "请输入一个文档名称:" filename

#文件存在与否
test -e "$filename" && echo "$filename文件存在！" || echo "$filename文件不存在！"
test ! -e "$filename" && exit 1

#文件类型
test -d "$filename" && echo "$filename是目录！"
test -f "$filename" && echo "$filename是文件！"

#文件读写权限
prop="当前用户$(whoami)针对$filename的权限:"
test -r "$filename" && prop=$prop" 可读" || prop=$prop" 不可读"
test -w "$filename" && prop=$prop" 可写" || prop=$prop" 不可写"
test -x "$filename" && prop=$prop" 可执行" || prop=$prop" 不可执行"
echo $prop
exit 0
