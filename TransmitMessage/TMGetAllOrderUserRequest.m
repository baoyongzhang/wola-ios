//
//  TMGetAllOrderUserRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMGetAllOrderUserRequest.h"

@implementation TMGetAllOrderUserRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_GET_ALL_CODE_ORDER_TYPE;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"codeList" value:self.codeList];
    return [super createJson];
}

@end
