//
//  TMUploadPhoneModelRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMUploadPhoneModelRequest.h"

@implementation TMUploadPhoneModelRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_UPLOAD_PHONEMODEL;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"phoneModel" value:self.phoneModel];
    return [super createJson];
}

@end
