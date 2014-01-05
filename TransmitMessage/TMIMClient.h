//
//  TMIMClient.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-19.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

#define SUFFIX @"\r\n"
#define NOTIFICATION_NEW_MESSAGE @"notification_new_message"
#define NOTIFICATION_NEW_LWMSG @"notification_new_lwmsg"

@class GCDAsyncSocket;
@class TMSend;

@interface TMIMClient : NSObject <GCDAsyncSocketDelegate>
{
    GCDAsyncSocket *_as;
}

@property (nonatomic, assign, readonly) BOOL isLogin;

+ (id)sharedInstance;

- (void) connect;
- (void) disconn;
- (void) send:(TMSend *) send;

@end
