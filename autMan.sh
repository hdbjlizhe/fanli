#/bin/bash
LOG_FILE="/var/log/autMan.log"

function log::info() {
  # 基础日志

  printf "[%s] \033[32mINFO:    \033[0m%s\n" "$(date +'%Y-%m-%d %H:%M:%S')" "$*" | tee -a "$LOG_FILE"
}

function log::error() {
  # 错误日志

  local item
  printf "[$(date +'%Y-%m-%d %H:%M:%S')] \033[31mERROR:   \033[0m$*\n" | tee -a "$LOG_FILE"

}


function utils::quote() {
  # 转义引号

  # shellcheck disable=SC2046
  if [ $(echo "$*" | tr -d "\n" | wc -c) -eq 0 ]; then
    echo "''"
  elif [ $(echo "$*" | tr -d "[a-z][A-Z][0-9]:,.=~_/\n-" | wc -c) -gt 0 ]; then
    printf "%s" "$*" | sed -e "1h;2,\$H;\$!d;g" -e "s/'/\'\"\'\"\'/g" | sed -e "1h;2,\$H;\$!d;g" -e "s/^/'/g" -e "s/$/'/g"
  else
    echo "$*"
  fi
}
function check::exit_code() {
  # 检查返回码

  local code=${1:-}
  local app=${2:-}
  local desc=${3:-}
  local exit_script=${4:-}

  if [[ "${code}" == "0" ]]; then
    log::info "[${app}]" "${desc} succeeded."
  else
    log::error "[${app}]" "${desc} failed."
    [[ "$exit_script" == "exit" ]] && exit "$code"
  fi
}

function command::exec() {
  local command="$*"
  command="$(utils::quote "$command")"
  
  # 本地执行
#   log::info "[command]" "bash -c $(printf "%s" "${command//${SUDO_PASSWORD:-}/******}")"
  # shellcheck disable=SC2094
  COMMAND_OUTPUT=$(eval bash -c "${command}" 2>>"$LOG_FILE" | tee -a "$LOG_FILE")
  local status=$?
  return $status
}

function install::Debian_Ubuntu(){
      # Debian 安装命令
        log::info "[apt]" "apt update and download python"
        command::exec "apt update -y && apt install -y wget python3 python3-pip"
        check::exit_code "$?" "apt" "apt install python" "exit"

        # if [ ! -f "~/.pip/pip.conf" ]; then
        #     mkdir -p ~/.pip
        #     echo "[global]" >> ~/.pip/pip.conf
        #     echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf
        # fi

        log::info "[pip3]" "pip3 dependency installation"
        command::exec "pip3 install requests user_agent PyExecJS aiohttp -i https://pypi.tuna.tsinghua.edu.cn/simple"
        check::exit_code "$?" "pip3" "pip3 install" "exit"

        
        log::info "[node]" "node install"
        command::exec "curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && apt install -y nodejs"
        check::exit_code "$?" "node" "node install" "exit"


        log::info "[node]" "node dependency installation"
        command::exec "npm install axios request require crypto-js"
        check::exit_code "$?" "node" "node dependency install" "exit"
        # log::info "[php]" "php install "
        # command::exec "apt-get install -y php"
        # check::exit_code "$?" "php" "php install" "exit"
}
function install::CentOS_Oracle(){
    log::info "[yum]" "yum update and download python"
        command::exec "yum update -y  && yum install -y wget python3 python3-pip"
        check::exit_code "$?" "yum" "yum install python" "exit"

        # if [ ! -f "~/.pip/pip.conf" ]; then
        #     mkdir -p ~/.pip
        #     echo "[global]" >> ~/.pip/pip.conf
        #     echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf
        # fi

        log::info "[pip3]" "pip3 dependency installation"
        command::exec "pip3 install requests user_agent PyExecJS aiohttp -i https://pypi.tuna.tsinghua.edu.cn/simple"
        check::exit_code "$?" "pip3" "pip3 install" "exit"

        
        log::info "[node]" "node install"
        command::exec "curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo -E bash - && yum install -y nodejs"
        check::exit_code "$?" "node" "node install" "exit"

        log::info "[node]" "node dependency installation"
        command::exec "npm install axios request require crypto-js"
        check::exit_code "$?" "node" "node dependency install" "exit"
        # log::info "[php]" "php install "
        # command::exec "yum install -y php"
        # check::exit_code "$?" "php" "php install" "exit"
}

function install::anuMan(){
    arch=$(uname -m)
    if [ "$arch" == "x86_64" ]; then
        a=amd64
    elif [ "$arch" == "aarch64" ]; then
        a=arm64
    fi
    latest_version=$(curl -s "https://ghproxy.homeboyc.cn/https://api.github.com/repos/hdbjlizhe/fanli/releases/latest" | grep -oP '"tag_name": "\K.*?(?=")')
    command::exec "mkdir -p /root/autMan
    cd /root/antMan
    wget http://gh.301.ee/https://github.com/hdbjlizhe/fanli/releases/download/$latest_version/autMan_$a.tar.gz;
    tar -zxvf autMan_$a.tar.gz -C /root/autMan;
    rm -rf autMan_$a.tar.gz
    chmod 777 /root/autMan/autMan
    pkill -9 /root/antMan/antMan
    /root/autMan/autMan -d"
    check::exit_code "$?" "anuMan install"

}
function main(){
    echo -e "\033[1;3$((RANDOM%10%8))m

    █████╗ ██╗   ██╗████████╗███╗   ███╗ █████╗ ███╗   ██╗
    ██╔══██╗██║   ██║╚══██╔══╝████╗ ████║██╔══██╗████╗  ██║
    ███████║██║   ██║   ██║   ██╔████╔██║███████║██╔██╗ ██║
    ██╔══██║██║   ██║   ██║   ██║╚██╔╝██║██╔══██║██║╚██╗██║
    ██║  ██║╚██████╔╝   ██║   ██║ ╚═╝ ██║██║  ██║██║ ╚████║
    ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ \033[0m"

    echo 
    echo "有问题请带上日志文件联系作者，路径为：$LOG_FILE"
    echo
    os=$(grep -oP 'NAME=["]?([^"]+)' /etc/os-release | awk -F= '{print $2}' | tr -d '"' | head -1)
    if [[ ! "$os" ]]; then
        log::error "获取系统信息错误"
        exit 
    else
        log::info "获取系统信息" "$os"
    fi
    log::info "开始安装基础环境"
    if [[ $os == *"Debian"* ]] || [[ $os == *"Ubuntu"* ]]; then
        install::Debian_Ubuntu

    elif [[ $os == *"CentOS"* ]] || [[ $os==*"Oracle"* ]]; then
        install::CentOS_Oracle
    fi

    log::info "开始安装AutMan"
    install::anuMan

    ps aux | grep autMan | grep -v grep 2>&1 > /dev/null
    if [ $? == 0 ];then
    log::info "autMan运行成功"
    else
    log::error "autMan运行失败,请手动运行"
    fi
    echo
    cat << EOF
安装路径：/root/autMan
运行命令：/root/autMan/autMan 前台运行 -t 交互运行  -d 后台默认运行
EOF

}

main