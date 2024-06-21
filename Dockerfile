FROM ponycool/alpine-3.16

#为 RUN、CMD、ENTRYPOINT、COPY 和 ADD 设置工作目录，就是切换目录
WORKDIR /autMan

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \
	&& ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 \
	&& apk add --no-cache libaio libnsl libc6-compat \
	&& mkdir /app \
	&& cd /app \
	&& apk update \
	&& apk add curl \
	&& apk add jq \
	&& apk add wget \
	&& apk add tar \
	&& apk add ffmpeg \
	&& apk add python3 \
	&& apk add py3-pip \
	&& apk add icu-data-full \
	&& apk add nodejs \
	&& apk add npm \
	&& apk add php php-cli php-fpm php-mysqli php-json php-openssl curl php-curl\
	&& apk add go \
	&& pip3 install --disable-pip-version-check --root-user-action=ignore requests PyExecJS aiohttp bs4 sseclient-py sseclient -i https://pypi.tuna.tsinghua.edu.cn/simple \
	&& npm install --save axios request require crypto-js global-agent got@11 dotenv base-64 jquery node-rsa fs png-js cheerio MD5 md5 -g --registry=https://registry.npmmirror.com

#复制文件
COPY ./docker-entrypoint.sh /bin/
COPY ./autMan ./MSYH.TTF ./robots.txt /app/autMan/
COPY ./views2 /app/autMan/views2
COPY ./jdicons /app/autMan/jdicons
COPY ./plugin/web /app/autMan/plugin/web
COPY ./plugin/scripts/middleware.js ./plugin/scripts/middleware.py ./plugin/scripts/middleware.sh ./plugin/scripts/middleware.php /app/autMan/plugin/scripts/
COPY ./task/configs/config.sh.sample ./task/configs/extra.sh.sample ./task/configs/task_before.sh.sample ./task/configs/task_after.sh.sample /app/autMan/task/configs/
COPY ./plugin/golang/go.mod /app/autMan/plugin/scripts/go.mod


#设置golang环境变量
ENV GO111MODULE=on \
	GOPROXY=https://goproxy.cn \
	NODE_PATH=/usr/local/lib/node_modules

#设置权限
RUN chmod a+x /bin/docker-entrypoint.sh \
	&& apk add git \
	&& apk add bash \
	&& apk add ffmpeg \
	&& cd /app/autMan/plugin/scripts \
	&& go get -u github.com/hdbjlizhe/middleware\
	&& go get github.com/buger/jsonparser\
	&& go get github.com/gin-gonic/gin\
	&& go get github.com/gin-contrib/sse

ENTRYPOINT ["/bin/docker-entrypoint.sh"]