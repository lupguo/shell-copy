#!/bin/bash
#Program	work4.sh
#Version	1.0
#Date		2015/4/30
#Author		Terry
#Purpose
#	Shell Script函数熟悉

echo "-------------------------------------------------------------------"
echo "熟悉shell函数"
echo "	1.函数是过程化的，其内部参数变更会影响到外部参数"
echo "-------------------------------------------------------------------"

fun1(){
	n=99
}

n=1
fun1
echo $n
