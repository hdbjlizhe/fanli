FROM ponycool/alpine-3.16

WORKDIR /autMan

# 安装基础库和依赖
RUN mkdir /lib64 \
    && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \
    && ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 \
    && apk add --no-cache libaio libnsl libc6-compat

# 创建工作目录
RUN mkdir /app

# 安装各种工具和语言支持
RUN apk update \
    && apk add --no-cache curl jq wget tar ffmpeg python3 py3-pip icu-data-full nodejs npm php php-cli php-fpm php-mysqli php-json php-openssl php-curl go

# 安装 Python 包
RUN pip3 install --disable-pip-version-check --root-user-action=ignore requests PyExecJS aiohttp bs4 sseclient-py sseclient

# 安装 Node.js 包
RUN npm install --save axios request require crypto-js global-agent got@11 dotenv base-64 jquery node-rsa fs png-js cheerio MD5 md5 -g

# 复制入口脚本和解压后的文件
COPY ./docker-entrypoint.sh /bin/
COPY ./app /app

# 设置golang环境变量
ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn \
    NODE_PATH=/usr/local/lib/node_modules

# 设置权限和安装 Golang 包
RUN chmod a+x /bin/docker-entrypoint.sh \
    && apk add --no-cache git bash ffmpeg \
    && cd /app/autMan/plugin/scripts \
    && go get -u github.com/hdbjlizhe/middleware \
    && go get github.com/buger/jsonparser \
    && go get github.com/gin-gonic/gin \
    && go get github.com/gin-contrib/sse

ENTRYPOINT ["/bin/docker-entrypoint.sh"]
