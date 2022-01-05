# fanli

交流群：418353744 线报群：263723430

# 更新版本

指令：更新

# 基础设置

京东/淘宝/唯品会需要设置的参数：

set fanli jingpinku_appid xxxxx (说明：京品库appid)

set fanli jingpinku_appkey xxxxx (说明：京品库appkey)

set fanli jd_union_id xxxx (说明：京东联盟ID)

set fanli apikey XXXXX (说明：订单侠apikey)

拼多多需要设置的参数：

set fanli client_id XXXX  (说明：多多进宝client_id)

set fanli client_secret XXXX (说明：多多进宝client_secret)

set fanli pid XXX (说明：多多进宝pid)

# 显示

1.自定义文案

set fanli cstm_cont    美丽商品优惠购

2.显示自定义文案

set fanli show_cstm  true/false

3.显示历史价格

set fanli show_lsjg    true/false 

4.显示货比3家

set fanli show_hb3j    true/false

5.显示图片

set fanli show_pict    true/false

6.显示几张图片

set fanli show_pict_num 1/2/3/4/5 

# 咖啡码

指令：喝咖啡xxxxxxxxxx（说明：订单完成时间1小时内用此命令，订单完成时间为收货确认时间）

或

指令：喝咖啡xxxxxxxxxx+2021-12-31 10:00:00（说明：订单完成时间超过1小时用此命令）

说明：xxxxxxxxxx为订单号，后面为订单完成时间（非下单时间）

如果在确认收货后的1小时内可不用加时间

# 监听转发

set fanli transfer true/false 说明：开启关闭监听转链转发

监听谁

set fanli transferFrom qqgroup:418353744,qqgroup:263723430,wxgroup:22853622845

set fanli transferListen qq:282617666,wx:hdbjlizhe

转发给谁

set fanli transferTo qqgroup:418353744,qqgroup:263723430,wxgroup:22853622845
