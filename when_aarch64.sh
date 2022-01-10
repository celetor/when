#!/bin/bash
# Copyright (c) 2019-2020 NibaZShab
# https://github.com/nibazshab/nibazshab.github.io/wiki/when
clear
colorhint="\033[36;43;1m"
colorend="\033[0m"
prompt="\n————————————————————————————————————\n"
function hint (){ echo -e "$prompt" ; }
function logo (){
	echo -e "\n\n\n\n\n\n"
	echo -e "               ■"
	echo -e "               ■"
	echo -e "               ■"
	echo -e "               ■"
	echo -e "  ■   ■   ■    ■■■■■■■    ■■■■■■■    ■■■■■■■"
	echo -e "  ■   ■   ■    ■     ■    ■     ■    ■     ■"
	echo -e "  ■   ■   ■    ■     ■    ■■■■■■■    ■     ■"
	echo -e "  ■   ■   ■    ■     ■    ■          ■     ■"
	echo -e "  ■■■■■■■■■    ■     ■    ■■■■■■■    ■     ■"
}
function home0 (){
	echo -e "\n\n\n\n\n"
	echo -e " 1   更换清华源\n"
	sleep 0.016
	echo -e " 2   底部小键盘\n"
	sleep 0.016
	echo -e " 3   取得储存权限\n"
	sleep 0.016
	echo -e " 4   使用fish终端\n"
	sleep 0.016
	echo -e " 5   其他东西\n"
	sleep 0.016
	echo -e " 6   编程环境配置\n"
	sleep 0.016
	echo -e " 7   超级大宝贝儿            99   充软妹币\n"
	sleep 0.016
	echo -e "                              0   退出\n\n\n"
}
function home1 (){
	cd ~
	read -p " ~> " home
	case $home in
		1 )
			sleep 1
			hint ; echo -e "官网: https://mirror.tuna.tsinghua.edu.cn/help/termux/" ; hint
			sleep 3
			sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
			apt update && apt upgrade -y
			home0 ; home1 ;;
		2 )
			sleep 1
			if test -d ~/.termux/ ; then
				:
			else
				mkdir -p ~/.termux/
			fi
			echo -e "extra-keys = [['TAB','>','-','~','/','*','$'],['ESC','(','HOME','UP','END',')','PGUP'],['CTRL','[','LEFT','DOWN','RIGHT',']','PGDN']]" > ~/.termux/termux.properties
			termux-reload-settings
			home0 ; home1 ;;
		3 )
			termux-setup-storage
			home0 ; home1 ;;
		4 )
			sleep 1
			pkg in -y wget unzip fish
			if test -d ~/.termux/ ; then
				:
			else
				mkdir -p ~/.termux/
			fi
			cd ~/.termux/
			wget https://github.com/nibazshab/nibazshab.github.io/releases/download/10/10.zip
			unzip 10.zip ; rm -rf 10.zip
			echo -e "function fish_greeting\nend" >> $PREFIX/etc/fish/config.fish
			chsh -s fish
			termux-reload-settings
			home0 ; home1 ;;
		5 )
			echo -e "\n\n"
			game0 ; game1 ;;
		6 )
			echo -e "\n\n"
			work0 ; work1 ;;
		7 )
			echo -e "\n\n"
			library0 ; library1 ;;
		99 )
			sleep 1
			read -p "请输入金额: " a
			case $a in
				[0-9]* )
					read -p "请输入支付密码: "
					echo -e "连接服务器..."
					sleep 1
					echo -e "成功充入 $a 软妹币"
					sleep 1
					echo -e "您已升为 svip" ;;
				* )
					sleep 1
					echo -e "服务器请求错误\n自毁程序启动..."
					sleep 3
					echo -e "boom!" ;;
			esac
			exit ;;
		0 )
			clear
			cat $PREFIX/etc/motd
			exit ;;
		00 )
			exit ;;
		* )
			echo -e "该项超脱了天地之外!"
			sleep 1
			home1 ;;
	esac
}
function game0 (){
	echo -e "\n\n\n\n\n"
	echo -e " 1   小火车\n"
	sleep 0.016
	echo -e " 2   彩虹猫\n"
	sleep 0.016
	echo -e " 3   贪吃蛇\n"
	sleep 0.016
	echo -e " 4   mpv播放器\n"
	sleep 0.016
	echo -e " 5   screenfetch\n"
	sleep 0.016
	echo -e " 6   neofetch\n"
	sleep 0.016
	echo -e " 7   纯文本浏览器\n"
	sleep 0.016
	echo -e " 8   ip\n"
	sleep 0.016
	echo -e " 9\n"
	sleep 0.016
	echo -e " 10   更换termux问候语\n"
	sleep 0.016
	echo -e " 11   adb\n"
	sleep 0.016
	echo -e "                              0   返回\n\n\n"
}
function game1 (){
	cd ~
	read -p " ~> " game
	case $game in
		1 )
			sleep 1
			hint ; echo -e "使用方法: 输入 sl" ; hint
			sleep 3
			pkg in -y sl
			game0 ; game1 ;;
		2 )
			sleep 1
			hint ; echo -e "使用方法: 输入 nyancat" ; hint
			sleep 3
			pkg in -y nyancat
			game0 ; game1 ;;
		3 )
			sleep 1
			hint ; echo -e "使用方法: 输入 nsnake\n如提示 80x24 , 请用双指捏合屏幕, 放大界面" ; hint
			sleep 3
			pkg in -y nsnake
			game0 ; game1 ;;
		4 )
			sleep 1
			hint ; echo -e "使用方法: 请自行百度" ; hint
			sleep 3
			pkg in -y mpv
			game0 ; game1 ;;
		5 )
			sleep 1
			hint ; echo -e "使用方法: 输入 screenfetch" ; hint
			sleep 3
			pkg in -y screenfetch
			game0 ; game1 ;;
		6 )
			sleep 1
			hint ; echo -e "使用方法: 输入 neofetch" ; hint
			sleep 3
			pkg in -y neofetch
			game0 ; game1 ;;
		7 )
			sleep 1
			hint ; echo -e "名称: w3m\n使用方法: 请自行百度" ; hint
			sleep 3
			pkg in -y w3m
			game0 ; game1 ;;
		8 )
			sleep 1
			ip -br -c addr
			exit ;;
		9 )
			echo "什么都没发生"
			exit ;;
		10 )
			sleep 1
			echo -e "\n\n\n\n\n  ----------------------------------------------------\n\n             民生各有所乐兮, 余独好修以为常\n             虽体解吾犹未变兮, 岂余心之可惩\n\n\n               　　　／　　　 ／   | \n                　　 Γ￣￣￣￣ |  | \n                　　 |[]::　　 |   | \n                　　 |＿＿_＿＿|　|\n                　　 |[]::　　 |　 | \n                　　 |＿＿_＿＿|　| \n                ｶﾞﾗｯ |＿＿_＿＿|　 | \n                 .彡／(´･ω･)　／|　| \n                   　Γ￣￣￣￣ |　|／ \n                    Ｌ＿＿＿＿_|／\n\n\n" > $PREFIX/etc/motd
			game0 ; game1 ;;
		11 )
			sleep 1
			hint ; echo -e "感谢 Coolapk@GoFly闻雪" ; hint
			sleep 3
			pkg in -y unzip wget
			wget https://github.com/nibazshab/nibazshab.github.io/releases/download/11/11.zip
			unzip 11.zip ; rm -rf 11.zip
			mv -f ~/adb $PREFIX/bin/
			mv -f ~/fastboot $PREFIX/bin/
			chmod +x $PREFIX/bin/adb
			chmod +x $PREFIX/bin/fastboot
			game0 ; game1 ;;
		0 )
			echo -e "\n\n"
			home0 ; home1 ;;
		00 )
			exit ;;
		* )
			echo -e "该项超脱了天地之外!"
			sleep 1
			game1 ;;
	esac
}
function work0 (){
	echo -e "\n\n\n\n\n"
	echo -e " 1   python\n"
	sleep 0.016
	echo -e " 2   java\n"
	sleep 0.016
	echo -e " 3   go\n"
	sleep 0.016
	echo -e " 4   c/c++\n"
	sleep 0.016
	echo -e " 5   php\n"
	sleep 0.016
	echo -e " 6   nodejs\n"
	sleep 0.016
	echo -e " 7   pip 清华源\n"
	sleep 0.016
	echo -e " 8   npm 淘宝源\n"
	sleep 0.016
	echo -e " 9   python_3.7\n"
	sleep 0.016
	echo -e "                              0   返回\n\n\n"
}
function work1 (){
	cd ~
	read -p " ~> " work
	case $work in
		1 )
			sleep 1
			pkg in -y python
			work0 ; work1 ;;
		2 )
			sleep 1
			pkg in -y wget
			wget https://github.com/nibazshab/nibazshab.github.io/releases/download/08/08.deb
			dpkg -i 08.deb ; rm -rf 08.deb
			work0 ;  work1 ;;
		3 )
			sleep 1
			pkg in -y golang
			work0 ; work1 ;;
		4 )
			sleep 1
			pkg in -y clang
			work0 ; work1 ;;
		5 )
			sleep 1
			pkg in -y php
			work0 ; work1 ;;
		6 )
			sleep 1
			pkg in -y nodejs
			work0 ; work1 ;;
		7 )
			sleep 1
			if test -e $PREFIX/bin/pip ; then
				hint ; echo -e "恢复官方源: rm -rf ~/.pip/" ; hint
				sleep 3
				mkdir -p ~/.pip/
				echo -e "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple\n[install]\ntrusted-host=mirrors.aliyun.com" > ~/.pip/pip.conf
			else
				echo -e "请先安装 python 环境"
			fi
			work0 ; work1 ;;
		8 )
			sleep 1
			if test -e $PREFIX/bin/npm ; then
				hint ; echo -e "恢复官方源: npm config set registry https://registry.npmjs.org/" ; hint
				sleep 3
				npm config set registry https://registry.npm.taobao.org
			else
				echo -e "请先安装 nodejs 环境"
			fi
			work0 ; work1 ;;
		9 )
			sleep 1
			pkg in -y wget unzip
			mkdir -p python3.7 ; cd python3.7
			wget https://github.com/nibazshab/nibazshab.github.io/releases/download/12/12.zip
			unzip 12.zip ; rm -rf 12.zip
			dpkg -i python_3.7.5-3_aarch64.deb
			dpkg -i python-static_3.7.5-3_aarch64.deb
			dpkg -i python-tkinter_3.7.5-3_aarch64.deb
			cd ~ ; rm -rf python3.7
			apt-mark python python-static
			work0 ; work1 ;;
		0 )
			echo -e "\n\n"
			home0 ; home1 ;;
		00 )
			exit ;;
		* )
			echo -e "该项超脱了天地之外!"
			sleep 1
			work1 ;;
	esac
}
function library0 (){
	echo -e "\n\n\n\n\n"
	echo -e " 1   刷流量\n"
	sleep 0.016
	echo -e " 2   atilo安装linux\n"
	sleep 0.016
	echo -e " 3   annie视频下载工具\n"
	sleep 0.016
	echo -e " 4   aria2下载器\n"
	sleep 0.016
	echo -e " 5   命令行版百度云\n"
	sleep 0.016
	echo -e " 6   qrcode二维码\n"
	sleep 0.016
	echo -e " 7   白嫖的网站hexo博客\n"
	sleep 0.016
	echo -e "  7.5   本地的动态hexo博客\n"
	sleep 0.016
	echo -e " 8   bilibili挂机工具\n"
	sleep 0.016
	echo -e " 9   ncm音乐格式解密\n"
	sleep 0.016
	echo -e "                              0   返回\n\n\n"
}
function library1 (){
	cd ~
	read -p " ~> " library
	case $library in
		1 )
			if test -e $PREFIX/bin/wget ; then
				:
			else
				pkg in -y wget
			fi
			i=0
			while [ $((i++)) -le 999 ]
			do
				wget -O /dev/null http://dlied5.myapp.com/myapp/1104466820/sgame/2017_com.tencent.tmgp.sgame_h8218_1.43.1.15_fc9dc4.apk
			done ;;
		2 )
			sleep 1
			hint ; echo -e "项目地址: https://github.com/YadominJinta/atilo" ; hint
			sleep 3
			echo -e "deb [trusted=yes] https://yadominjinta.github.io/files/ termux extras" >> $PREFIX/etc/apt/sources.list
			pkg in atilo-cn
			atilo
			library0 ; library1 ;;
		3 )
			sleep 1
			hint ; echo -e "感谢 coolapk@萌系生物研究员\n项目地址: https://github.com/iawia002/annie" ; hint
			sleep 3
			pkg in -y golang git ffmpeg
			git clone https://github.com/iawia002/annie.git
			cd annie/
			GOOS=android GOARCH=arm64 go build -o $PREFIX/bin/annie main.go
			cd ~
			chmod -Rf 777 go/
			rm -rf annie/ go/
			library0 ; library1 ;;
		4 )
			sleep 1
			hint ; echo -e "使用方法: 输入 ~/aria2\n项目地址: https://github.com/aria2/aria2" ; hint
			sleep 3
			pkg in -y aria2 wget clang
			mkdir -p ~/.config/aria2/
			touch ~/.config/aria2/aria2.session
			wget -O ~/.config/aria2/aria2.conf https://github.com/nibazshab/nibazshab.github.io/releases/download/09/09.conf
			wget https://github.com/nibazshab/nibazshab.github.io/releases/download/09/09.c
			gcc -o ~/aria2 09.c
			rm -rf 09.c
			library0 ; library1 ;;
		5 )
			sleep 1
			hint ; echo -e "使用方法: 输入 ~/bdy\n项目地址: https://github.com/iikira/BaiduPCS-Go" ; hint
			sleep 3
			pkg in -y golang git
			git clone https://github.com/iikira/BaiduPCS-Go.git
			cd BaiduPCS-Go/
			GOOS=android GOARCH=arm64 go build -o ~/bdy main.go
			cd ~
			chmod -Rf 777 go/
			rm -rf BaiduPCS-Go/ go/
			library0 ; library1 ;;
		6 )
			sleep 1
			hint ; echo -e "项目地址: https://github.com/sylnsfar/qrcode" ; hint
			sleep 3
			pkg in -y python
			pip install qrcode
			library0 ; library1 ;;
		7 )
			sleep 1
			hint ; echo -e "请阅读小白教程, 自行完成博客的搭建\n教程地址: https://nibazshab.github.io/post/3" ; hint
			sleep 3
			library0 ; library1 ;;
		7.5 )
			sleep 1
			hint ; echo -e "博客开启方法：cd ~/hexo/blog/ && hexo s" ; hint
			sleep 2
			pkg in -y nodejs-lts
			mkdir -p ~/hexo/blog/
			cd ~/hexo/
			npm install hexo-cli -g
			npm install hexo --save
			cd ~/hexo/blog/
			hexo init
			library0 ; library1 ;;
		8 )
			sleep 1
			hint ; echo -e "使用方法: 输入 node ~/BilibiliHelper/index.js\n项目地址: https://github.com/metowolf/BilibiliHelper" ; hint
			sleep 3
			pkg in -y nodejs-lts git
			git clone https://github.com/metowolf/BilibiliHelper.git
			cd ~/BilibiliHelper/
			npm install
			mv -f ~/BilibiliHelper/.env.example ~/BilibiliHelper/.env
			echo -e "\n请输入 vi ~/BilibiliHelper/.config 编辑配置文件"
			sleep 3
			library0 ; library1 ;;
		9 )
			sleep 1
			hint ; echo -e "项目地址: https://github.com/anonymous5l/ncmdump" ; hint
			sleep 3
			pkg in -y git clang taglib
			git clone https://github.com/anonymous5l/ncmdump.git
			cd ncmdump/
			g++ main.cpp cJSON.cpp aes.cpp ncmcrypt.cpp -o $PREFIX/bin/ncmdump -ltag
			strip $PREFIX/bin/ncmdump
			cd ~
			rm -rf ncmdump/
			library0 ; library1 ;;
		0 )
			echo -e "\n\n"
			home0 ; home1 ;;
		00 )
			exit ;;
		* )
			echo -e "该项超脱了天地之外!"
			sleep 1
			library1 ;;
	esac
}
logo
sleep 1
home0 ; home1
exit
