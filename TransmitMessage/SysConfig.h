//
//  SysConfig.h
//  WhoyaoClientProject
//
//  Created by Reuniontech on 12-11-12.
//  Copyright (c) 2012年 Reuniontech. All rights reserved.


#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif

/**********************************服务器参数************************************/

//定义判断是否有网络的地址
#ifndef REACHPATH
#define REACHPATH @"www.baidu.com"
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


