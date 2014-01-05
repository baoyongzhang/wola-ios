//
//  TMReceive.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMReceive.h"
#import "NSData+AES.h"
#import "TMParser.h"
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

@implementation TMReceive

+ (TMReceive *)parse:(NSString *)json
{
    @try {
        // 解密
        NSData *data = [NSData AESDecryptWithText:json];
        NSLog(@"im receive = %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        TMReceive *receive = [[TMReceive alloc] init];
        // 解析类型
        [TMParser parseJson:data toObject:receive];
        int type = receive.type.intValue;
        
        NSLog(@"%@ type = %i", receive, type);
        if(type > 0){
            TMReceive *temp = nil;
            switch (type) {
                case IM_RECEIVE_LOGIN_STATE:
                    temp = [[TMLoginReceive alloc] init];
                    break;
                case IM_RECEIVE_LEAVEWORD:
                    temp = [[TMLeavewordReceive alloc] init];
                    break;
                case IM_RECEIVE_MESSAGE:
                    temp = [[TMMessageReceive alloc] init];
                    break;
                case IM_RECEIVE_READ_MESSAGE:
                    temp = [[TMReadReceive alloc] init];
                    break;
                case IM_RECEIVE_SEND_STATE:
                    temp = [[TMSendReceive alloc] init];
                    break;
                case IM_RECEIVE_SERVICE_MESSAGE:
                    temp = [[TMServiceReceive alloc] init];
                    break;
                case IM_RECEIVE_SYSTEM_MESSAGE:
                    temp = [[TMSystemMsgReceive alloc] init];
                    break;
                case IM_RECEIVE_USER_STATE:
                    temp = [[TMUserStateReceive alloc] init];
                    break;
                case IM_RECEIVE_VERSION_UPDATE:
                    temp = [[TMVersionUpdateReceive alloc] init];
                    break;

            }
            if(temp){
                [TMParser parseJson:data toObject:temp];
                return temp;
            }
        }
        return receive;
    }
    @catch (NSException *exception) {
        NSLog(@"catch exception = %@", exception.name);
    }
    @finally {
        
    }
    return nil;
}

@end
