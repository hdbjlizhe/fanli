import requests
import sys

# 本地服务的请求
def get_local_service_response(path,params):
    print("网络请求")
    url = "http://localhost:9999/otto"+path
    response = requests.get(url, params)
    print(response.text)
    return response

# 获取发送者ID
def getSenderID():
    return sys.argv[1]

# 推送消息
def push(imType,groupCode,userID,title,content):
    path="/push"
    params={
        "imType":imType,
        "groupCode":groupCode,
        "userID":userID,
        "title":title,
        "content":content
    }
    get_local_service_response(path,params)

# 获取机器人名称
def name():
    path="/name"
    params={}
    response=get_local_service_response(path,params)
    return response.text

# 获取机器id
def machineId():
    path="/machineId"
    params={}
    response=get_local_service_response(path,params)
    return response.text

# 获取autMan版本
def version():
    path="/version"
    params={}
    response=get_local_service_response(path,params)
    return response.text

# 获取数据库数据
def get(key):
    path="/get"
    params={
        "key":key
    }
    response=get_local_service_response(path,params)
    return response.text

# 设置数据库数据
def set(key,value):
    path="/set"
    params={
        "key":key,
        "value":value
    }
    response=get_local_service_response(path,params)
    return response.text

# 删除数据库数据
def delete(key):
    path="/delete"
    params={
        "key":key
    }
    response=get_local_service_response(path,params)
    return response.text

# 获取指定数据库指定key的值
def bucketGet(bucket,key):
    path="/bucketGet"
    params={
        "bucket":bucket,
        "key":key
    }
    response=get_local_service_response(path,params)
    return response.text

# 设置指定数据库指定key的值
def bucketSet(bucket,key,value):
    path="/bucketSet"
    params={
        "bucket":bucket,
        "key":key,
        "value":value
    }
    response=get_local_service_response(path,params)
    return response.text

# 删除指定数据库指定key的值
def bucketDelete(bucket,key):
    path="/bucketDelete"
    params={
        "bucket":bucket,
        "key":key
    }
    response=get_local_service_response(path,params)
    return response.text

# 获取指定数据库的所有什为value的keys
def bucketKeys(bucket,value):
    path="/bucketKeys"
    params={
        "bucket":bucket,
        "value":value
    }
    response=get_local_service_response(path,params)
    # 使用逗号分隔字符串
    return response.text.split(",")

# 获取指定数据库的所有的key集合
def bucketAllKeys(bucket):
    path="/bucketAllKeys"
    params={
        "bucket":bucket
    }
    response=get_local_service_response(path,params)
    # 使用逗号分隔字符串
    return response.text.split(",")

# 通知管理员
def notifyMasters(content,imtypes):
    path="/notifyMasters"
    params={
        "content":content,
        "imtypes":",".join(imtypes),
    }
    get_local_service_response(path,params)

# 当前系统咖啡码激活状态
def coffee():
    path="/coffee"
    params={}
    response=get_local_service_response(path,params)
    return response.text=="true"

# 京东、淘宝、拼多多转链推广
def spread(msg):
    path="/spread"
    params={
        "msg":msg
    }
    response=get_local_service_response(path,params)
    return response.text

class Sender:
    # 类的构造函数
    def __init__(self, senderID):
        self.senderID = senderID

    # 获取发送者渠道
    def getImtype(self):
        path="/getImtype"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text
    
    # 获取发送者ID
    def getUserID(self):
        path="/getUserID"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text
    
    # 获取发送者昵称
    def getUserName(self):
        path="/getUserName"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text

    # 获取发送者头像
    def getUserAvatarUrl(self):
        path="/getUserAvatarUrl"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text

    # 获取发送者群号
    def getChatID(self):
        path="/getChatID"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text
    
    # 获取发送者群名称
    def getChatName(self):
        path="/getChatName"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text

    # 是否管理员
    def isAdmin(self):
        path="/isAdmin"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text=="true"
    
    # 获取消息
    def getMessage(self):
        path="/getMessage"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text
    
    # 获取消息ID
    def getMessageID(self):
        path="/getMessageID"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text
    
    # 撤回消息
    def recallMessage(self,messageid):
        path="/recallMessage"
        params={
            "senderid":self.senderID,
            "messageid":messageid
        }
        get_local_service_response(path,params)
    
    # 获取匹配的文本参数
    def param(self,i):
        path="/param"
        params={
            "senderid":self.senderID,
            "index":i
        }
        response=get_local_service_response(path,params)
        return response.text

    # 回复文本消息
    def reply(self,text):
        path="/sendText"
        params={
            "senderid":self.senderID,
            "text":text
        }
        get_local_service_response(path,params)
    
    # 回复图片消息
    def replyImage(self,imageUrl):
        path="/sendImage"
        params={
            "senderid":self.senderID,
            "imageurl":imageUrl
        }
        get_local_service_response(path,params)

    # 回复语音消息
    def replyVoice(self,voiceUrl):
        path="/sendVoice"
        params={
            "senderid":self.senderID,
            "voiceurl":voiceUrl
        }
        get_local_service_response(path,params)

    # 回复视频消息
    def replyVideo(self,videoUrl):
        path="/sendVideo"
        params={
            "senderid":self.senderID,
            "videourl":videoUrl
        }
        get_local_service_response(path,params)
    
    # 等待用户输入,timeout为超时时间，单位为毫秒
    def listen(self,timeout):
        path="/listen"
        params={
            "senderid":self.senderID,
            "timeout":timeout
        }
        response=get_local_service_response(path,params)
        return response.text
    
    # 修改用户内容重新送往机器人消息处理通道
    def breakIn(self,content):
        path="/breakIn"
        params={
            "senderid":self.senderID,
            "content":content
        }
        get_local_service_response(path,params)

    # 等待支付
    def waitPay(self,exitcode,timeout):
        path="/waitPay"
        params={
            "senderid":self.senderID,
            "exitcode":exitcode,
            "timeout":timeout # 超时时间，单位为毫秒
        }
        response=get_local_service_response(path,params)
        return response.text
    
    # 系统是否处于等待支付状态
    def atWaitPay(self):
        path="/atWaitPay"
        params={
            "senderid":self.senderID
        }
        response=get_local_service_response(path,params)
        return response.text=="true"

    # 添加好友至群聊
    def groupInviteIn(self,friend,group):
        path="/groupInviteIn"
        params={
            "senderid":self.senderID,
            "friend":friend,
            "group":group,
        }
        get_local_service_response(path,params)

    # 群聊踢人
    def groupKick(self,userid):
        path="/groupKick"
        params={
            "senderid":self.senderID,
            "userid":userid,
        }
        get_local_service_response(path,params)
    
    # 群聊禁言
    def groupBan(self,userid,timeout):
        path="/groupBan"
        params={
            "senderid":self.senderID,
            "userid":userid,
            "timeout":timeout,
        }
        get_local_service_response(path,params)
    
    # 群聊解除禁言
    def groupUnban(self,userid):
        path="/groupUnban"
        params={
            "senderid":self.senderID,
            "userid":userid,
        }
        get_local_service_response(path,params)
    
    # 群聊全员禁言
    def groupWholeBan(self):
        path="/groupWholeBan"
        params={
            "senderid":self.senderID,
        }
        get_local_service_response(path,params)
    
    # 群聊全员解禁
    def groupWholeUnban(self):
        path="/groupWholeUnban"
        params={
            "senderid":self.senderID,
        }
        get_local_service_response(path,params)
    
    # 群聊内发送公告
    def groupNoticeSend(self,notice):
        path="/groupNoticeSend"
        params={
            "senderid":self.senderID,
            "notice":notice,
        }
        get_local_service_response(path,params)

    # 获取当前处理流程的插件名
    def getPluginName(self):
        path="/getPluginName"
        params={
            "senderid":self.senderID,
        }
        response=get_local_service_response(path,params)
        return response.text
    
    # 获取当前处理流程的插件版本
    def getPluginVersion(self):
        path="/getPluginVersion"
        params={
            "senderid":self.senderID,
        }
        response=get_local_service_response(path,params)
        return response.text

# 定时指令的相关操作
class Cron:

    # 构造函数
    def __init__(self, cronID):
        self.cronID = cronID

    # 获取cronID