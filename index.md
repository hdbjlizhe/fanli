- [讨论交流](#讨论交流)
- [返利插件基础教程](#返利插件基础教程)
  - [更新版本](#更新版本)
  - [咖啡码](#咖啡码)
    - [咖啡码的获取、续期](#咖啡码的获取续期)
    - [咖啡码的迁入迁出](#咖啡码的迁入迁出)
  - [基本参数设置](#基本参数设置)
    - [京东/淘宝/唯品会需要设置的参数：（带删除线的为精简掉的参数）](#京东淘宝唯品会需要设置的参数带删除线的为精简掉的参数)
    - [查询收益需要设置的参数：](#查询收益需要设置的参数)
    - [拼多多需要设置的参数：](#拼多多需要设置的参数)
  - [关于转链功能](#关于转链功能)
    - [显示设置](#显示设置)
      - [显示模式](#显示模式)
        - [显示模式之文字模式](#显示模式之文字模式)
        - [显示模式之海报模式](#显示模式之海报模式)
        - [显示模式之京粉模式（京东红包）](#显示模式之京粉模式京东红包)
  - [关于价格监控](#关于价格监控)
  - [关于提示的开启和关闭](#关于提示的开启和关闭)
  - [群内转链回复](#群内转链回复)
  - [关于监听转发](#关于监听转发)
  - [关于佣金分成](#关于佣金分成)
  - [关于命令屏蔽](#关于命令屏蔽)
- [homeassistant插件基础教程](#homeassistant插件基础教程)

# 讨论交流

交流群：418353744

线报群：263723430


# 返利插件基础教程

## 更新版本

指令：更新/升级/update/upgrade

## 咖啡码

咖啡码即授权码，新装用户会自动获得7天体验期全功能咖啡码。

咖啡码有效时：所有转成的短链均为自己的

咖啡码无效时：所有转成的短链均为作者的

### 咖啡码的获取、续期

（1）自行获取，将京东商品分享给群主机器人或群主测试机器人，通过返回的短链购买京东商品。确认收货后给自己机器人以下指令注入咖啡码：

指令：喝咖啡xxxxxxxxxx+2021-12-31 10:00:00

指令：coffeexxxxxxxxxx+2021-12-31 10:00:00

说明：xxxxxxxxxx为订单号，后面为下单时间

（2）打赏获取，打赏群主机器人或群主测试机器人后，联系群主索取。

### 咖啡码的迁入迁出

**前提条件：老机器人和新机器人绑定的管理员账户一致！**

**重要：老机器人迁出咖啡码后，老机器人仍然可用，但咖啡码失效且无法再次注入咖啡码**

咖啡码迁出指令：迁出咖啡码

咖啡码迁入：将老机器人迁出的咖啡码整条信息直接转发给新机器人即可。

## 基本参数设置

中文交互指令：设置参数

### 京东/淘宝/唯品会需要设置的参数：（带删除线的为精简掉的参数）

~~`set fanli jingpinku_appid xxxxx` (说明：京品库appid)~~

~~`set fanli jingpinku_appkey xxxxx` (说明：京品库appkey)~~

`set fanli jd_union_id xxxx` (说明：京东联盟ID)

`set fanli jd_union_key xxxxx` (说明：京东联盟API授权key)

`set fanli apikey xxxxx` (说明：订单侠apikey)

`set fanli zhe_appkey xxxxx`（说明：折淘客appkey）

`set fanli zhe_sid xxxxx`(说明：折淘客sid)

`set fanli tb_union_pid xxxxxxx`(说明：淘宝联盟下的推广位，必须是选择的淘宝授权帐号下的PID，格式为：mm_56655336_24530010_191526926)

### 查询收益需要设置的参数：

`set fanli jd_union_appkey xxxxx`(说明：京东联盟appkey)

`set fanli jd_union_secretkey xxxxx`(说明：京东联盟secretkey)

### 拼多多需要设置的参数：

`set fanli client_id XXXX`  (说明：多多进宝client_id)

`set fanli client_secret XXXX` (说明：多多进宝client_secret)

`set fanli pid XXX` (说明：多多进宝pid)

***重要提示：以上参数设置完成后要重启、重启、重启（重要的事说3遍）才能生效，否则使用的是开箱初始化的参数***


## 关于转链功能

### 显示设置

#### 显示模式

0.文字模式

指令：文字模式

set fanli reply_mode 0

1.海报模式

指令：海报模式

set fanli reply_mode 1

2.京粉模式

指令：京粉模式

set fanli reply_mode 2

3.混合模式

指令：混合模式

set fanli reply_mode 3

##### 显示模式之文字模式

1.自定义文案

set fanli cstm_cont    美丽商品优惠购

指令：设置文案：美丽商品优惠购

2.显示自定义文案

set fanli show_cstm  true/false

指令：显示自定义文案/关闭自定义文案

3.显示历史价格

set fanli show_lsjg    true/false 

指令：显示历史价格/关闭历史价格

4.显示货比3家

set fanli show_hb3j    true/false

指令：显示货比3家/关闭货比3家

5.显示图片

set fanli show_pict    true/false

指令：显示图片/关闭图片

6.显示几张图片

set fanli show_pict_num 1/2/3/4/5 


![QQ图片20220107115320](https://user-images.githubusercontent.com/22290807/148489504-747120d5-bfef-436e-baeb-2af993eb81d7.jpg)

##### 显示模式之海报模式

海报模式指令：

set fanli reply_mode 2（说明：设置回复模式）

set fanli host_name http://ikuai.zhelee.cn:9999/  (说明：设置域名)

set fanli pict_cata /root/sillyGirl/tmp/    (说明：生成的海报存放的目录，最后要有斜杠)

海报模式需要公网并部署文件服务器，安装python3等相关软件，部署方式参照如下:

（1）进入你需要作为服务器的目录,比如：cd /root/sillyGirl/tmp,在目录内放个图片1.jpg，后面测试用。

（2）输入命令：nohup python3 -m http.server 9999 &   （说明：9999为端口号,最好重启现下，再次运行左边的命令）

（3）开放端口：比如：CentOS命令：firewall-cmd --zone=public --add-port=9999/tcp --permanent

（4）机器人的9999端口映射到外网的9999端口 （说明：端口根据自己情况设置）

（5）服务器ip+端口能访问表示成功。比如：http://ikuai.zhelee.cn:9999/1.jpg

（4）查看服务： lsof -i，如果启动的目录错误，可记下服务的进程号，然后“kill -9 进程号”杀死进程，然后再cd到正确的目录，运行（2）所述命令

![QQ图片20220121152954](https://user-images.githubusercontent.com/22290807/150485051-09c31d3c-4dd0-431f-a7e8-4afea3f8715c.jpg)

##### 显示模式之京粉模式（京东红包）

进入京东联盟->我的推广->京享红包推广->获取无线推广链接

set fanli jd_quan https://u.jd.com/PdOTAgr

![QQ图片20220124082111](https://user-images.githubusercontent.com/22290807/150704408-fb22fcbb-a414-453c-b77e-f72ebdd2ac03.png)

## 关于价格监控

使用方法：1.开启价格监控提示，2.分享商品到机器人，3.当提示是否加入价格监控时输入y

价格监测时间设置

set fanli cron_check_price 0 9,14 * * *（不设置默认为每天9点和14点进行价格监测）

指令：购物车/查询监控 （说明：显示当前购物车内容，并进行价格比较）

指令：删除商品1  （说明：删除当前购物车中1号价格监控位的商品）

指令：清空购物车  （说明：将购物内商品全部删除）

## 关于提示的开启和关闭

指令：开启转发线报群提示 （说明：单聊机器人时，分享商品到机器人后，机器人返回转链信息后，提示是否转发线报群）

set fanli transfer_remind true

指令：关闭转发线报群提示 （说明：单聊机器人时，分享商品到机器人后，机器人返回转链信息后，提示是否转发线报群）

set fanli transfer_remind false

指令：开启默认转发 （说明：单聊机器人时，分享商品到机器人后，机器人返回转链信息后，不提示直接转发线报群）

set fanli transfer_default true

指令：关闭默认转发 （说明：单聊机器人时，分享商品到机器人后，机器人返回转链信息后，默认不转发线报群）

set fanli transfer_default false

指令：开启价格监控提示（说明：单聊机器人时，分享商品到机器人后，机器人返回转链信息后，提示是否加入价格监控）

set fanli watching_remind true

指令：关闭价格监控提示（说明：单聊机器人时，分享商品到机器人后，机器人返回转链信息后，提示是否加入价格监控）

set fanli watching_remind false

## 群内转链回复

想让机器人在某个群内对发送的短链进行转链回复,方法有二

1. set fanli replyGroups 418353744,123456789  想回复短链的群

2. 机器人和机器人管理员都必须在“拟对短链进行转链回复”的群内，机器人管理员在群内发指令：“开启群回复”或“打开群回复”开启，“关闭群回复”关闭

## 关于监听转发

(1)京东转发

set fanli transfer true/false 说明：开启关闭监听转链转发

set fanli transferJdFreq 10 说明：转发频率不低于10分钟1次 

set fanli transferFrom 418353744,263723430,22853622845    监听什么群,qq群，微信群，tg等均可

set fanli transferListen 282617666,hdbjlizhe 监听上面设置的群中的某个人

set fanli transferTo qqgroup:418353744,qqgroup:263723430,wxgroup:22853622845 转发给谁转发给谁

（2）淘宝转发

set fanli transferTb true/false 说明：开启关闭监听转链转发

set fanli transferTbFreq 10 说明：转发频率不低于10分钟1次 

set fanli transferTbFrom 418353744,263723430,22853622845  监听什么群，qq群，微信群，tg等均可

set fanli transferTbListen 282617666,hdbjlizhe  监听上面设置的群中的某个人

set fanli transferTbTo qqgroup:418353744,qqgroup:263723430,wxgroup:22853622845 转发给谁


## 关于佣金分成

指令：查询收益

订单认领指令为订单号，如京东订单，发指令：123456789012（此处为订单号）

设置用户分成比例:set fanli ratio 0/0.5/1 (说明：0表示关闭收益分成，0.5表示分一半，1表示全返还)

开启分成的一定要在本月20日-本月底前给用户发放上月的收益，否则进入下个月后，上上个月的数据自动删除。

## 关于命令屏蔽

set fanli blocked_cmds 查询收益,收益查询

设置完成后需重启

# homeassistant插件基础教程

set ha host http://192.168.1.11:8123   （说明：ha地址）

set ha token xxxxxx   (说明：长期令牌)

交互命令：ha

直接控制命令：ha打开进门灯/ha关闭进门灯
