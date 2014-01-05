//
//  TMIMFileRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMIMFileRequest.h"

@implementation TMIMFileRequest

- (id)initWithType:(NSString *)type
{
    self = [super init];
    if (self) {
        self.type = @"";
        self.fileType = type;
        self.sendType = SEND_TYPE_ONE;
    }
    return self;
}

- (NSData *)createJson
{
    return [super createJson];
}

@end
