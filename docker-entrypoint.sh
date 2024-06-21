#!/bin/sh

# 代码目录
if [ -z $CODE_DIR ]; then
	CODE_DIR=/autMan
fi

# 代码目录不存在则拷贝
if [ ! -f $CODE_DIR/autMan ]; then
	echo "autMan 不存在"
	cp -n -r /app/autMan/* /autMan
else
 	echo "autMan 存在"
fi

# 进入代码目录
chmod 777 $CODE_DIR
cd $CODE_DIR 
echo -e "=================== 如果第一次配置机器人，请先配置机器人 ==================="
echo "启动"
	chmod 777 autMan
	./autMan