
//
//  TMIMClient.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-19.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMIMClient.h"
#import "NSData+AES.h"
#import "TMConfig.h"
#import "TMLoginSend.h"
#import "TMReceive.h"
#import "TMLoginReceive.h"
#import "TMHeartbeatReceive.h"
#import "TMLeavewordReceive.h"
#import "TMMessageReceive.h"
#import "TMReadReceive.h"
#import "TMSendReceive.h"
#import "TMServiceReceive.h"
#import "TMSystemMsgReceive.h"
#import "TMUserStateReceive.h"
#import "TMVersionUpdateReceive.h"

@interface TMIMClient ()

@property (nonatomic, strong) NSMutableArray *buff;

@end

@implementation TMIMClient

+ (id)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self) {
        _as = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        [_as performBlock:^{
            [_as enableBackgroundingOnSocket];
        }];
    }
    return self;
}

#pragma mark - 连接相关

- (void)connect
{
    NSLog(@"connecting ip = %@, port = %i", [TMConfig getString:IM_SERVER], [TMConfig getInt:IM_SERVER_PORT]);
    NSError *error = nil;
    [_as connectToHost:[TMConfig getString:IM_SERVER] onPort:[TMConfig getInt:IM_SERVER_PORT] error: &error];

    if(error != nil){
        NSLog(@"connect fail, %@", error.localizedDescription);
    }
}

- (void)disconn
{
    [_as disconnect];
}

- (void) reconnect
{
    [self disconn];
    [self connect];
}

#pragma mark - 消息相关

- (void)send:(TMSend *) send
{
    [_as writeData:[send createJson] withTimeout:30 tag:1];
}

#pragma mark - Socket代理方法

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"%@", @"didConnectToHost");
    
    [_as readDataWithTimeout:-1 tag:0];
    
    // 登陆
    [self send:[[TMLoginSend alloc] init]];
    
}

- (void)socketDidCloseReadStream:(GCDAsyncSocket *)sock
{
    NSLog(@"socketDidCloseReadStream");
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    _isLogin = NO;
    NSLog(@"socketDidDisconnect, error = %@", err.localizedDescription);
    // 重连
    [self reconnect];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)srcData withTag:(long)tag
{
    NSString *srcStr = [[NSString alloc] initWithData:srcData encoding:NSUTF8StringEncoding];
//    NSLog(@"%li---------------------%@", tag, srcStr);
    
    // 判断结尾是不是\r\n，如果不是那么没有的读取完毕，等待读取完毕再解析
    if(![srcStr hasSuffix:SUFFIX]){
        if(!self.buff)
            self.buff = [NSMutableArray array];
        [self.buff addObject:srcData];
    }else{
        // 合并缓冲区
        if(self.buff){
            NSMutableData *mData = [NSMutableData data];
            for (NSData *data in self.buff) {
                [mData appendData:data];
            }
            [mData appendData:srcData];
            self.buff = nil;
            
            srcStr = [[NSString alloc] initWithData:mData encoding:NSUTF8StringEncoding];
        }
        
        NSArray *array = [srcStr componentsSeparatedByString:SUFFIX];
        if(array.count > 1){
            for (int i = 0; i < array.count; i++) {
                if(i == (array.count - 1))
                    break;
                NSString *str = [array objectAtIndex:i];
                // 处理消息
                [self handleReceive:str];
            }
        }

    }
    
    [_as readDataWithTimeout:-1 tag:0];

}

#pragma mark - 处理消息

- (void) handleReceive:(NSString *)str
{
    // 解析数据
    TMReceive *receive = [TMReceive parse:str];
    int type = receive.type.intValue;
    switch (type) {
        case IM_RECEIVE_LOGIN_STATE:
            [self handleLoginReceive:(TMLoginReceive *)receive];
            break;
        case IM_RECEIVE_HEARTBEAT:
            [self handleHeartbeatReceive:(TMHeartbeatReceive *)receive];
            break;
        case IM_RECEIVE_LEAVEWORD:
            [self handleLeavewordReceive:(TMLeavewordReceive *)receive];
            break;
        case IM_RECEIVE_MESSAGE:
            [self handleMessageReceive:(TMMessageReceive *)receive];
            break;
        case IM_RECEIVE_READ_MESSAGE:
            [self handleReadReceive:(TMReadReceive *)receive];
            break;
        case IM_RECEIVE_SEND_STATE:
            [self handleSendReceive:(TMSendReceive *)receive];
            break;
        case IM_RECEIVE_SERVICE_MESSAGE:
            [self handleServiceReceive:(TMServiceReceive *)receive];
            break;
        case IM_RECEIVE_SYSTEM_MESSAGE:
            [self handleSystemMsgReceive:(TMSystemMsgReceive *)receive];
            break;
        case IM_RECEIVE_USER_STATE:
            [self handleUserStateReceive:(TMUserStateReceive *)receive];
            break;
        case IM_RECEIVE_VERSION_UPDATE:
            [self handleVersionUpdateReceive:(TMVersionUpdateReceive *)receive];
            break;
    }
}

- (void) handleLoginReceive:(TMLoginReceive *)receive
{
    _isLogin = YES;
    NSLog(@"登陆成功");
}

- (void) handleHeartbeatReceive:(TMHeartbeatReceive *)receive
{
}

- (void) handleLeavewordReceive:(TMLeavewordReceive *)receive
{
    // 保存到数据库
    // 发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NEW_LWMSG object:receive];
}

- (void) handleMessageReceive:(TMMessageReceive *)receive
{
}

- (void) handleReadReceive:(TMReadReceive *)receive
{
}

- (void) handleSendReceive:(TMSendReceive *)receive
{
}

- (void) handleServiceReceive:(TMServiceReceive *)receive
{
}

- (void) handleSystemMsgReceive:(TMSystemMsgReceive *)receive
{
}

- (void) handleUserStateReceive:(TMUserStateReceive *)receive
{
}

- (void) handleVersionUpdateReceive:(TMVersionUpdateReceive *)receive
{
}

@end
