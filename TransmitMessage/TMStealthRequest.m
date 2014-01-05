//
//  TMStealthRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMStealthRequest.h"

@implementation TMStealthRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_STEALTH;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"stealthType" value:self.stealthType];
    return [super createJson];
}

@end
