//
//  TMRegisterRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMRegisterRequest.h"

@implementation TMRegisterRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_REGISTER;
        self.companyid = @"0";
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"companyid" value:self.companyid];
    [self addKey:@"systemVersion" value:self.systemVersion];
    [self addKey:@"phoneModel" value:self.phoneModel];
    return [super createJson];
}

@end
