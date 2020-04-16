#!/bin/bahs
#Program	sh18.sh
#Version	1.0
#Date		2015/4/29
#Purpose	
#	熟悉for循环的另外一种for((i;i<100;i++))的模式
#	计算1+2+..用户输入的值

echo "------------------------------------"
echo "1+2+3+...input 求和"
echo "------------------------------------"

while [ "$rs" != "yes" ]
do
	read -p "请输入一个数字：" num
	echo "$num"|grep -E "^[0-9]{1,8}$" && rs="yes" || rs="no"
done

sum=0
for ((i=0; i<=$num ; i++))
do
	sum=$(($i+$sum))	
done

echo "1+2+...$sum的和为:$sum"
exit 0

