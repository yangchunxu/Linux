#!/bin/bash
:<<!
安装nginx 2020 11 9
!

function install_n(){
#安装依赖
yum -y install gcc pcre-devel openssl-devel &> /dev/null
#解压源码包
read -p "请输入nginx安装包路径：" dir
[[ -z dir ]] && tar -xf "${dir}" || echo "路径错误";exit
#源码编译安装
cd nginx-1.17.6
./configure
make
make install
}

#设置字体颜色
function colour(){
        echo -e "\033[${1}m${2}\033[0m"
}

#nginx服务管理
function systemctl_nginx(){
:<<!
start:启动服务|stop:停止服务|status:查看服务状态
!

read -p "请输入选项:stop|start|status：" n
case $n in
        start)
                /usr/local/nginx/sbin/nginx;;
        stop)
                /usr/local/nginx/sbin/nginx -s stop;;
        restart)
                /usr/local/nginx/sbin/ -s stop
                /usr/local/nginx/sbin/;;
        status)
                netstat -ntulp | grep -q nginx
                [ $? -eq 0 ] && colour 92 "服务以运行" || colour 91 "服务未启动";;
        *)
                echo "start|stop|status";;
esac
}

echo "-----请选择所需服务-----"
echo "1.安装服务.."
echo "2.管理服务.."
read -p "请选择：" num


case $num in
	1)
		install_n
		;;
	2)
		systemctl_nginx
		;;
	*)
		echo "输入有误:${num}"
		;;
esac

