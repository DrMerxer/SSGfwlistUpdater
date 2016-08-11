printf "欢迎使用闷声发大财SSgfwlist自动更新器，请确保您正在使用Mac平台并且已安装Shadowsocks再继续操作\n"
echo "作者测试系统版本为OS X 10.11.5,其他系统版本不保证一定能够运行"
echo "在开始安装之前，我们要安装一些必须的软件包，请在需要的时候输入密码"
printf "软件包列表：\nHomebrew\nPython\nPython-pip\nwget\ngfwlist2pac\n"
echo
printf "安装Homebrew？y/n:"

read brewInstallation
if [ $brewInstallation == "y" ]
then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

printf "其他组件安装? y/n:"
read firstStep
if [ $firstStep == "y" ]
then	
	brew install python&&
	brew install wget&&
	wget https://bootstrap.pypa.io/get-pip.py&&
	sudo chown -R ~/Library/Python/2.7/site-packages&&
	sudo -H python get-pip.py&&
	sudo pip install gfwlist2pac&&	
	printf "完成组件安装......\n"
else
	printf "跳过组件安装......\n"
	
fi

echo "正在更新..."
rm -rf ~/.ShadowsocksX/gfwlist.js.bak
cp ~/.ShadowsocksX/gfwlist.js ~/.ShadowsocksX/gfwlist.js.bak
rm -rf ~/.ShadowsocksX/gfwlist.js
wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt&&
gfwlist2pac -i gfwlist.txt -f gfwlist.js -p "SOCKS5 127.0.0.1:1080" --precise&&
mv gfwlist.js ~/.ShadowsocksX/gfwlist.js

echo "Clean..."
rm -rf gfwlist.txt
rm -rf get-pip.py
printf "\n\n为了您未来更好地使用你的Mac，这些几乎必备的组件我们不会删除."
echo "如果你坚持删除,去 http://yobin.live 获取删除说明书"

echo "添加到开机启动？（正在建设中...）"
echo "感谢各位大触的开源项目，特别感谢clowwindy同学，对网络自由事业作出的努力"
echo "V1.0.0 coded by NativeJM"
