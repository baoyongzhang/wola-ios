//
//  TMGetLeaveWordFileUrlRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMGetLeaveWordFileUrlRequest.h"

@implementation TMGetLeaveWordFileUrlRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_GET_LEAVEWORD_FILEURL;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"leavewordStateNum" int:self.leavewordStateNum];
    return [super createJson];
}

@end
