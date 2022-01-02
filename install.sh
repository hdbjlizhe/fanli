#!/bin/bash
############################################
##QQ交流群：418353744
##QQ线报群：263723430
############################################
color()
{
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
change()
{
    if [[ "$os" == "debian"  &&  "$cpu" == "amd64" ]];then
        apt-get install wget git tar -y
        url=https://dl.golang.com.cn/dl/go/go1.17.5.linux-amd64.tar.gz
        wget $url
        tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
    elif [[ "$os" == "centos"  &&  "$cpu" == "amd64"  ]];then
        yum install wget git openssl openssl-devel gcc make perl tar -y
        url=https://dl.golang.com.cn/dl/go/go1.17.5.linux-amd64.tar.gz
        wget $url
        tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
    elif [[ $cpu == "arm64" ]];then
        apt-get install wget git tar -y
        url=https://dl.golang.com.cn/dl/go/go1.17.5.linux-arm64.tar.gz
        wget $url
        tar -C /usr/local -xzf go1.17.5.linux-arm64.tar.gz
    else
        exit 1
    fi
}

maingo()
{
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

sillyGirl()
{
    color
    s=sillyGirl;#检查系统是arm版还是x86_64版   
    #如果当前系统存在sillyGirl，先杀死
    echo "检查当前系统是否有正在运行的sillyGirl..."
    pkill -9 $s;
    #检查当前目录有没有sillyGirl文件，如果有进入备份sillyGirl.cache文件
    if [ ! -d "/sillyGirl/" ]; then
        echo "当前存在sillyGirl目录,准备备份数据文件..."
        cp sillyGirl/sillyGirl.cache ./
        sleep 3s
        echo "准备备份sets.conf..."
        cp sillyGirl/sets.conf ./
        sleep 3s
        echo "准备备份js文件..."
        cp -r sillyGirl/develop/replies ./
        echo "sillyGirl文件夹删除中..."
        rm -r sillyGirl
        sleep 3s
    fi
    #克隆sillyGirl库
    echo "开始克隆sillyGirl库..."
    git clone https://ghproxy.com/https://github.com/cdle/sillyGirl.git;
    #进入sillyGirl文件夹
    if [ $? -eq 0 ]; then 
        sleep 3s
        echo "进入sillyGirl文件夹..."
        cd $s
    fi
    #获取dev.go文件
    echo "下载dev.go文件"
    wget https://ghproxy.com/https://raw.githubusercontent.com/hdbjlizhe/oneKeyForSillGirl/main/dev.go
    #进入develop文件夹
    if [[ $? == 0 ]]; then
        sleep 3s
        cd develop;
        sleep 3s
    fi
    echo "进入develop文件夹，开始克隆常用库、返利库"
    #克隆一些必要的库
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/fanli_jd.git;
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/fanli_tb.git;
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/fanli_pdd.git;
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/fanli_vip.git;
    git clone https://ghproxy.com/https://github.com/ufuckee/jd_cookie.git;
    git clone https://ghproxy.com/https://github.com/cdle/jd_price.git;
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/yangmao.git
    #编译
    #if [[ $? == 0 ]]; then 
    #    cd ..;
    #    sleep 3s 
    #    echo "开始编译..."
    #    go build;
    #    echo "编译完成！！！"
    #fi
    cd ..;
    sleep 3s
    wget https://ghproxy.com/https://github.com/hdbjlizhe/fanli/releases/download/main/sillyGirl_amd64.tar.gz
    tar -zxvf sillyGirl_amd64.tar.gz
    #将备份的文件拷进sillyGirl文件夹
    sleep 3s
    cd ..
    echo "拷贝数据文件到sillyGirl目录"
    cp ./sillyGirl.cache sillyGirl/;
    sleep 3s
    echo "拷贝sets.conf到sillyGirl目录"
    cp ./sets.conf sillyGirl/;
    sleep 3s
    echo "拷贝js文件到sillyGirl目录"
    cp -r replies sillyGirl/develop/;
    sleep 3s  
    echo "安装完成，开始享用吧!!!"
}

if [ "$GOROOT" != "" ]; then
    echo "系统环境：$GOROOT，已存在"
    sleep 3s
    echo "当前系统已经安装了Go环境，开始安装sillyGirl..."
    sleep 3s
    sillyGirl
else
    echo "当前系统未安装GO环境，开始安装Go环境..."
    maingo
fi
