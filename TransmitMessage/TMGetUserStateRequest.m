//
//  TMGetUserStateRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMGetUserStateRequest.h"

@implementation TMGetUserStateRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_GET_USER_STATE;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"queryPhoneNumber" value:self.queryPhoneNumber];
    return [super createJson];
}

@end
