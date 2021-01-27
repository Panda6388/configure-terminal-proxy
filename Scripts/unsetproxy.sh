#! /bin/bash
file1="$HOME/.bashrc"
file2="/etc/apt/apt.conf" 
file3="/etc/environment" 
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
