#!/bin/bash
color(){
    green='\e[1;32m'
    res='\e[0m'
    yellow='\e[1;33m'
    echo -e ${green}
    clear
}

hello(){
    #!/bin/sh   
    echo "检查系统..."
    check_centos=`cat /etc/redhat-release`
    check=`uname  -a`
    os=debian
    cpu=arm64;
    if [[ $check_centos =~ "CentOS" ]];
        then os="centos"
    fi
    if [[ $check =~ "ubuntu" ]];
        then os="ubuntu"
    fi
    if [[ $check =~ "x86_64" ]]; then
        cpu="amd64"
    fi
    echo "当前系统为：" $os
    echo "当前架构为：" $cpu
    sleep 3s
}
change(){
    if [[ "$os" == "debian"  &&  "$cpu" == "amd64" ]];then
        apt-get install wget git tar -y
        url=https://dl.golang.com.cn/dl/go/go1.18.linux-amd64.tar.gz
        wget $url
        tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz
    elif [[ "$os" == "centos"  &&  "$cpu" == "amd64"  ]];then
        yum install wget git openssl openssl-devel gcc make perl tar -y
        url=https://dl.golang.com.cn/dl/go/go1.18.linux-amd64.tar.gz
        wget $url
        tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz
    elif [[ $cpu == "arm64" ]];then
        apt-get install wget git tar -y
        url=https://dl.golang.com.cn/dl/go/go1.18.linux-arm64.tar.gz
        wget $url
        tar -C /usr/local -xzf go1.18.linux-arm64.tar.gz
    else
        exit 1
    fi
}

maingo(){
    color
    GO111MODULE=on
    GOPROXY=https://goproxy.cn
    GOROOT=/usr/local/go
    GOPATH=/usr/local/go/path
    #GOBIN=/root/go/bin
    PATH=$PATH:$GOROOT/bin:$GOPATH/bin
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn
    export GOROOT=/usr/local/go
    export GOPATH=/usr/local/go/path
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

    command='cat /etc/profile|grep $ GOROOT'
    if [-n "$command"];then
        echo -e ${yellow}
        echo -e ${res}
        sillyGirl
        exit 1
    else
        hello
        change
        #mkdir $HOME/go $HOME/go/src
        echo "export GOROOT=${GOROOT}">>/etc/profile
        echo "export GOPATH=${GOPATH}">>/etc/profile
        echo "export GO111MODULE=on"  >>/etc/profile
        echo "export GOPROXY=https://goproxy.cn" >>/etc/profile
        echo "export PATH=${PATH}">>/etc/profile
        . $HOME/.profile
        echo -e ${green}
        sleep 3s
        echo "Go安装完成"
        echo -e ${res}
        sleep 10s
        sillyGirl
    fi
}
maingo()
