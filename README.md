# 讨论交流

交流群：418353744

线报群：263723430

# 基础设置

京东/淘宝/唯品会需要设置的参数：

set fanli jingpinku_appid xxxxx (说明：京品库appid)

set fanli jingpinku_appkey xxxxx (说明：京品库appkey)

set fanli jd_union_id xxxx (说明：京东联盟ID)

set fanli apikey XXXXX (说明：订单侠apikey)

set fanli zhe_appkey xxxxx（折淘客appkey）

set fanli zhe_sid xxxxx(折淘客sid)

set fanli tb_union_pid xxxxxxx(淘宝联盟下的推广位)

拼多多需要设置的参数：

set fanli client_id XXXX  (说明：多多进宝client_id)

set fanli client_secret XXXX (说明：多多进宝client_secret)

set fanli pid XXX (说明：多多进宝pid)



# 更新版本

指令：更新/update

# 显示

1.自定义文案

set fanli cstm_cont    美丽商品优惠购

指令：自定义方案：美丽商品优惠购

2.显示自定义文案

set fanli show_cstm  true/false

指令：显示自定义方案/关闭自定义方案

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

# 咖啡码

指令：喝咖啡xxxxxxxxxx+2021-12-31 10:00:00

指令：coffeexxxxxxxxxx+2021-12-31 10:00:00

说明：xxxxxxxxxx为订单号，后面为下单时间

如果在确认收货后的1小时内发送指令可不用加时间

# 购物车

指令：购物车

# 短链的监听转发

(1)京东转发

set fanli transfer true/false 说明：开启关闭监听转链转发

set fanli transferJdFreq 10 说明：转发频率10分钟1次 

set fanli transferFrom 418353744,263723430,22853622845    监听什么群

set fanli transferListen 282617666,hdbjlizhe 监听上面设置的群中的某个人

set fanli transferTo qqgroup:418353744,qqgroup:263723430,wxgroup:22853622845 转发给谁转发给谁

（2）淘宝转发

set fanli transferTb true/false 说明：开启关闭监听转链转发

set fanli transferJdFreq 10 说明：转发频率10分钟1次 

set fanli transferTbFrom 418353744,263723430,22853622845  监听什么群

set fanli transferTbListen 282617666,hdbjlizhe  监听上面设置的群中的某个人

set fanli transferTbTo qqgroup:418353744,qqgroup:263723430,wxgroup:22853622845 转发给谁

# 转链回复

想让机器人在某个群对群内发送的短链进行转链回复,方法有二

1. set fanli replyGroups 418353744,123456789  想回复短链的群

2. 机器人和机器人管理员都必须在“拟对短链进行转链回复”的群内，机器人管理员在群内发指令：“开启群回复”或“打开群回复”开启，“关闭群回复”关闭
