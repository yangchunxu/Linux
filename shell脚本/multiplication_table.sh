#!/bin/bash
:<<!
2020 11 5 杨春旭
打印九九乘法表
!
for((i=1;i<=9;i++))
do
	for((j=1;j<=$i;j++))
	do
		echo -n "$i*$j=$[$i*$j] "
	done
	echo -e "\n"
done
