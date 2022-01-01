############################################
##QQ交流群：418353744
##QQ线报群：263723430
############################################
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
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/yangmao.git;
    git clone https://ghproxy.com/https://github.com/ufuckee/jd_cookie.git;
    git clone https://ghproxy.com/https://github.com/cdle/jd_price.git;
    #编译
    #if [[ $? == 0 ]]; then 
    #    cd ..;
    #    sleep 3s 
    #    echo "开始编译..."
    #    go build;
    #    echo "编译完成！！！"
    #fi
    cd ..
    sleep 3s
    wget https://github.com/hdbjlizhe/fanli/releases/download/main/sillyGirl_amd64.tar.gz
    tar -xzvf sillyGirl_amd64.tar.gz
    #将备份的文件拷进sillyGirl文件夹
    sleep 3s
    cd ..
    echo "拷贝数据文件到sillyGirl目录"
    cp ./sillyGirl.cache sillyGirl/;
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
    echo "当前系统未安装GO环境，请先安装Go环境..."
    sleep 3s
    exit 1
fi
