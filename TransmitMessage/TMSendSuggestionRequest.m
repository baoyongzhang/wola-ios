//
//  TMSendSuggestionRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMSendSuggestionRequest.h"

@implementation TMSendSuggestionRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_SEND_SUGGESTION;
    }
    return self;
}

- (NSData *)createJson
{
    [self addKey:@"suggestion" value:self.suggestion];
    return [super createJson];
}

@end
