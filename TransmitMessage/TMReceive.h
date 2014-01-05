//
//  TMReceive.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IM_RECEIVE_MESSAGE 1    // 即时消息
#define IM_RECEIVE_USER_STATE 2 // 用户状态更新
#define IM_RECEIVE_VERSION_UPDATE 3 // 版本更新
#define IM_RECEIVE_SYSTEM_MESSAGE 4 // 系统消息
#define IM_RECEIVE_LEAVEWORD 5  // 留言消息
#define IM_RECEIVE_READ_MESSAGE 6   // 已读报告
#define IM_RECEIVE_LOGIN_STATE 7    // 登陆状态
#define IM_RECEIVE_EXTI_STATE 8 // 退出状态
#define IM_RECEIVE_SEND_STATE 9 // 发送消息状态
#define IM_RECEIVE_SERVICE_MESSAGE 10   // 送达报告
#define IM_RECEIVE_HEARTBEAT 11 // 心跳反馈

@interface TMReceive : NSObject

@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber *result;

+ (TMReceive *) parse:(NSString *) json;

@end
