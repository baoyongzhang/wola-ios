//
//  TMIMGourpMessageRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMIMGourpMessageRequest.h"

@implementation TMIMGourpMessageRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_SEND_GROUP_MEG;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"receivers" value:self.receivers];
    [self addKey:@"megid" value:self.megid];
    [self addKey:@"content" value:self.content];
    return [super createJson];
}

@end
