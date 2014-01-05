//
//  SysConfig.h
//  WhoyaoClientProject
//
//  Created by Reuniontech on 12-11-12.
//  Copyright (c) 2012年 Reuniontech. All rights reserved.



/**********************************服务器参数************************************/


//定义openfire地址
#ifndef HOSTNAME
//#define HOSTNAME @"opstest.whoyao.com"
#define HOSTNAME @"ops1.whoyao.com"
#endif

//定义openfire域名
#ifndef HOSTDOMAIN
#define HOSTDOMAIN @""
//#define HOSTDOMAIN @"jayla-pc"
#endif

//定义openfire端口
#ifndef HOSTPORT
#define HOSTPORT 5222
#endif

//定义资源
#ifndef RESOURCE
#define RESOURCE @"WhoyaoIOSProject"
#endif

//定义接口地址
#ifndef SERVERPATH
#define SERVERPATH @"http://www.whoyao.com/AndroidService/"
//#define SERVERPATH @"http://try.whoyao.net:8009/"
#endif

//定义判断是否有网络的地址
#ifndef REACHPATH
#define REACHPATH @"www.baidu.com"
#endif

//定义java接口地址

#ifndef USERSERVERPATH
#define USERSERVERPATH @"http://opstest.whoyao.com:8080/whoyao/"
//#define USERSERVERPATH @"http://10.10.1.133:8080/whoyao/"
#endif

/***********************************系统参数***********************************/

//定义系统Delegate
#ifndef APPDELEGATE
#define APPDELEGATE (AppDelegate *)[UIApplication sharedApplication].delegate
#endif

//定义XMPPDelegate
#ifndef XMPPDELEGATE
#define XMPPDELEGATE [XMPPDelegate defaultXmpp]
#endif

//定义弹出提示Delegate
#ifndef CONTROLTKALERTDELEGATE
#define CONTROLTKALERTDELEGATE [ControlTKAlert defaultCenter]
#endif

//定义字体名
#ifndef FONT
#define FONT @"Helvetica"
#endif

//定义字体名粗体
#ifndef FONTBOLD
#define FONTBOLD @"Helvetica-Bold"
#endif

//系统启动相关标记文件
#ifndef SYSCONFIGFILE
#define SYSCONFIGFILE [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingFormat:@"/systemConfigFile.plist"]
#endif

//沙盒路径
#ifndef DOCUMENTPATH 
#define DOCUMENTPATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] 
#endif

//获取系统版本
#ifndef SYSTEMVERISON
#define SYSTEMVERISON [[UIDevice currentDevice] systemVersion]
#endif

//是否是iphone5
#define IS_IPHONE_5 ( fabs( (double)[[UIScreen mainScreen] bounds].size.height - (double)568 ) < DBL_EPSILON )  

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


//头像照片地址
#ifndef HEADIMGPATH
#define HEADIMGPATH @"http://img.whoyao.com/WhoYaoUploadFiles/oimg/"
//#define HEADIMGPATH @"http://img.whoyao.net/WhoYaoUploadFiles/oimg/"
#endif

//用户手机号码
#ifndef KEYFORUSERPHONE
#define KEYFORUSERPHONE @"_userPhoneNumber"
#endif

//用户邮箱
#ifndef KEYFORUSEREMAIL
#define KEYFORUSEREMAIL @"_userEmail"
#endif

//用户密码
#ifndef KEYFORUSERPWD
#define KEYFORUSERPWD @"_userPwd"
#endif

//用户昵称
#ifndef KEYFORUSERNICKNAME
#define KEYFORUSERNICKNAME @"_userNickname"
#endif

//用户UserID
#ifndef KEYFORUSERUSERID
#define KEYFORUSERUSERID @"_userID"
#endif

//用户登录使用账号
#ifndef KEYFORUSERACCOUNT
#define KEYFORUSERACCOUNT @"_userAccount"
#endif

//用户头像地址
#ifndef KEYFORUSERFACE
#define KEYFORUSERFACE @"_userFace"
#endif

//是否在聊天界面（包括私信列表和私信详情界面）
#ifndef KEYISCHATPAGE
#define KEYISCHATPAGE @"_isChat"
#endif

#ifndef VALUEISCHAT
#define VALUEISCHAT @"_value"
#endif

//是否在通知界面（包括通知列表）
#ifndef KEYISNOTICEPAGE
#define KEYISNOTICEPAGE @"_isNotice"
#endif

#ifndef VALUEISNOTICE
#define VALUEISNOTICE @"_value"
#endif

//是否在邀请界面（包括邀请列表）
#ifndef KEYISINVITEPAGE
#define KEYISINVITEPAGE @"_isInvite"
#endif

#ifndef VALUEISINVITE
#define VALUEISINVITE @"_value"
#endif

//推送token

#ifndef KEYTOKEN
#define KEYTOKEN @"_token"
#endif

//提醒设置（声音）
#ifndef KEYVOICENOTICE
#define KEYVOICENOTICE @"_voice"
#endif

//震动
#ifndef KEYSHAKENOTICE
#define KEYSHAKENOTICE @"_shake"
#endif
