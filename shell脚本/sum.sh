#!bin/bash
:<<!
2020 11 9 杨春旭
输入一个整数求各项和
!

m=0
read -p "请输入：" num
sum=$num
while :
do
	if (($num==0));then
		break
	fi
	((m+=$[num%10]))
	((num/=10))
done
echo "${sum}各位求和=：${m}"
