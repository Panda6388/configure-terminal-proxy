#! /bin/bash

file1="$HOME/.bashrc"
file2="/etc/apt/apt.conf" 
file3="/etc/environment" 

proxyserver="172.16.2.30"
proxyport="8080"
for file in $file1 $file2 $file3;do
	if [[ ! -e $file ]];then
		touch $file
	fi	
	sed -i '/https/d' $file
	sed -i '/ftp/d' $file
	sed -i '/http/d' $file
	sed -i '/socks/d' $file
	sed -i '/HTTPS/d' $file
	sed -i '/FTP/d' $file
	sed -i '/HTTP/d' $file
	sed -i '/SOCKS/d' $file

done
sed -i '/localhost/d' $file3
#setting .bashrc proxy
echo "export https_proxy="https://$proxyserver:$proxyport/""  >>$file1
echo "export ftp_proxy="ftp://$proxyserver:$proxyport/"" >>$file1
echo "export socks_proxy="socks://$proxyserver:$proxyport/"" >>$file1 
echo "export http_proxy="http://$proxyserver:$proxyport/"" >>$file1

#setting /etc/apt/apt.conf proxy
echo "Acquire::https::proxy \"https://$proxyserver:$proxyport/\";" >>$file2 
echo "Acquire::ftp::proxy \"ftp://$proxyserver:$proxyport/\";" >>$file2
echo "Acquire::socks::proxy \"socks://$proxyserver:$proxyport/\";" >>$file2
echo "Acquire::http::proxy \"http://$proxyserver:$proxyport/\";" >>$file2

#setting /etc/environment proxy
echo "no_proxy=localhost,10.*.*.*" >>$file3
echo "https_proxy=\"https://$proxyserver:$proxyport/\""  >>$file3 
echo "ftp_proxy=\"ftp://$proxyserver:$proxyport/\"" >>$file3 
echo "socks_proxy=\"socks://$proxyserver:$proxyport/\"" >>$file3 
echo "http_proxy=\"http://$proxyserver:$proxyport/\"" >>$file3


