
//
//  TMExceptionUpdateRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMExceptionUpdateRequest.h"

@implementation TMExceptionUpdateRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_EXCEPTION_UPDATE;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"versionCode" float:self.versionCode];
    [self addKey:@"phoneModel" value:self.phoneModel];
    [self addKey:@"phoneVersion" value:self.phoneVersion];
    [self addKey:@"userInfo" value:self.userInfo];
    [self addKey:@"exceptionContent" value:self.exceptionContent];
    [self addKey:@"date" long:self.date];
    return [super createJson];
}
@end
