//
//  TMReadReceivedSend.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMReadReceivedSend.h"

@implementation TMReadReceivedSend

- (id)init
{
    self = [super init];
    if (self) {
        self.type = IM_SEND_READ_RECEIVE;
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
