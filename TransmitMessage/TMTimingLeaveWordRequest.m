//
//  TMTimingLeaveWordRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMTimingLeaveWordRequest.h"

@implementation TMTimingLeaveWordRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_TIMING_LEAVEWORD;
        self.dataType = 1;
    }
    return self;
}

- (id)initWithIsCancel:(BOOL)isCancel
{
    self = [super init];
    if (self) {
        self.dataType = isCancel ? 0 : 1;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"timingid" long:self.timingid];
    [self addKey:@"leavewordStateNum" int:self.leavewordStateNum];
    [self addKey:@"leavewordTime" int:self.leavewordTime];
    [self addKey:@"beginTime" int:self.beginTime];
    [self addKey:@"week" int:self.week];
    return [super createJson];
}

@end
