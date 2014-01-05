
//
//  TMCheckVersionUpRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMCheckVersionUpRequest.h"

@implementation TMCheckVersionUpRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_CHECK_UP_VERSION;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"versionCode" float:self.versionCode];
    return [super createJson];
}

@end
