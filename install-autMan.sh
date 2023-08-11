#!/bin/bash

# 获取系统信息
os=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
os=${os//\"/}

# 判断系统类型并执行相应的安装命令
if [[ $os == *"Debian"* ]]; then
    # Debian 安装命令
    echo "Installing Python 3 and pip on Debian..."
    sudo apt update
    sudo apt install -y python3 python3-pip

    echo "Installing Node.js on Debian..."
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs

    echo "Installing PHP on Debian..."
    sudo apt install -y php

elif [[ $os == *"CentOS"* ]]; then
    # CentOS 安装命令
    echo "Installing Python 3 and pip on CentOS..."
    sudo yum install -y epel-release
    sudo yum install -y python3 python3-pip

    echo "Installing Node.js on CentOS..."
    curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
    sudo yum install -y nodejs

    echo "Installing PHP on CentOS..."
    sudo yum install -y php

elif [[ $os == *"OpenWrt"* ]]; then
    # OpenWrt 安装命令
    echo "Installing Python 3 and pip on OpenWrt..."
    opkg update
    opkg install python3 python3-pip

    echo "Installing Node.js on OpenWrt..."
    opkg install node
    
    echo "Installing PHP on OpenWrt..."
    opkg install php7

else
    echo "Unsupported operating system: $os"
    exit 1
fi

echo "Installation completed."

# GitHub
repo_owner="hdbjlizhe"
repo_name="fanli"

# 发送 API 请求获取最新发布信息
response=$(curl -s "https://api.github.com/repos/$repo_owner/$repo_name/releases/latest")

# 解析 JSON 响应，提取最新版本号
latest_version=$(echo "$response" | grep -oP '"tag_name": "\K.*?(?=")')

# 输出最新版本号
echo "Latest version of $repo_owner/$repo_name: $latest_version"
if [ ! "$latest_version" ];then 
    exit;
fi;


s=autMan;
a=arm64;
if [[ $(uname -a | grep "x86_64") != "" ]];then 
    a=amd64;
fi;
if [ ! -d $s ];then 
    mkdir $s;
fi;
cd $s;
wget https://github.com/hdbjlizhe/fanli/releases/download/${latest_version}/autMan_$a.tar.gz;
tar -zxvf autMan_$a.tar.gz;
rm -rf autMan_$a.tar.gz;
chmod 777 $s;
pkill -9 $s;
$(pwd)/$s -t;
