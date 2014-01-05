//
//  TMSystemReceivedSend.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMSystemReceivedSend.h"

@implementation TMSystemReceivedSend

- (id)init
{
    self = [super init];
    if (self) {
        self.type = IM_SEND_SYSTEM_RECEIVE;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"megid" value:self.megid];
    return [super createJson];
}

@end
