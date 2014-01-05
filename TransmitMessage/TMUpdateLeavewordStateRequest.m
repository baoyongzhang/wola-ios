//
//  TMUpdateLeavewordStateRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMUpdateLeavewordStateRequest.h"

@implementation TMUpdateLeavewordStateRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_UPDATE_LEAVEWORD_STATE;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"leavewordStateNum" int:self.leavewordStateNum];
    [self addKey:@"leavewordTime" long:self.leavewordTime];
    return [super createJson];
}

@end
