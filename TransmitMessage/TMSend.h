//
//  TMSend.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IM_SEND_LOGIN 1 // 登陆
#define IM_SEND_EXIT 2  // 退出
#define IM_SEND_SEND_MESSAGE 3  // 即时消息
#define IM_SEND_RECEIVE_MESSAGE 4   // 已收报告
#define IM_SEND_HEARDBEAT 5 // 心跳
#define IM_SEND_READ_RECEIVE 6  // 已读报告的已收报告
#define IM_SEND_SERVICE_RECEIVE 7   // 送达报告的已收报告
#define IM_SEND_SYSTEM_RECEIVE 8    // 系统消息的已收报告
#define IM_SEND_CANCEL_MESSAGE 9    // 撤销发送即时消息

@interface TMSend : NSObject
{
    @private
    NSMutableDictionary *_dict;
    @protected
    NSMutableDictionary * _rootDict;
}

@property(nonatomic, assign) int type;
@property(nonatomic, strong) NSString *SIMSerialNumber;
@property(nonatomic, strong) NSString *phoneNumber;

- (void) addKey:(NSString *)key value:(NSObject *)value;
- (void) addKey:(NSString *)key int:(int)value;
- (void) addKey:(NSString *)key float:(float)value;
- (void) addKey:(NSString *)key long:(long)value;
- (NSData *) createJson;

@end
