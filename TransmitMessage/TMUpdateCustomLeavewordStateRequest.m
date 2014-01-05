//
//  TMUpdateCustomLeavewordStateRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMUpdateCustomLeavewordStateRequest.h"

@implementation TMUpdateCustomLeavewordStateRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_UPDATE_CUSTOM_LEAVEWORD_STATE;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"leavewordTime" long:self.leavewordTime];
    return [super createJson];
}

@end
