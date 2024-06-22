FROM ponycool/alpine-3.16

WORKDIR /app

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \
    && ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 \
    && apk add --no-cache libaio libnsl libc6-compat \
    && mkdir /app \
    && cd /app \
    && apk update \
    && apk add curl jq wget tar ffmpeg python3 py3-pip icu-data-full nodejs npm php php-cli php-fpm php-mysqli php-json php-openssl php-curl go \
    && pip3 install --disable-pip-version-check --root-user-action=ignore requests PyExecJS aiohttp bs4 sseclient-py sseclient \
    && npm install --save axios request require crypto-js global-agent got@11 dotenv base-64 jquery node-rsa fs png-js cheerio MD5 md5 -g

# 复制入口脚本和解压后的文件
COPY ./docker-entrypoint.sh /bin/
COPY ./app /app

# 设置golang环境变量
ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn \
    NODE_PATH=/usr/local/lib/node_modules

# 设置权限
RUN chmod a+x /bin/docker-entrypoint.sh \
    && apk add git bash ffmpeg \
    && cd /app/autMan/plugin/scripts \
    && go get -u github.com/hdbjlizhe/middleware \
    && go get github.com/buger/jsonparser \
    && go get github.com/gin-gonic/gin \
    && go get github.com/gin-contrib/sse

ENTRYPOINT ["/bin/docker-entrypoint.sh"]
