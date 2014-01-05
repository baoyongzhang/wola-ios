//
//  TMReceivedSend.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMReceivedSend.h"

@implementation TMReceivedSend

- (id)init
{
    self = [super init];
    if (self) {
        self.type = IM_SEND_RECEIVE_MESSAGE;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"megid" value:self.megid];
    [self addKey:@"receiver" value:self.receiver];
    return [super createJson];
}

@end
