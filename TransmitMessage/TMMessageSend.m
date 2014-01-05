//
//  TMMessageSend.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMMessageSend.h"

@implementation TMMessageSend

- (id)init
{
    self = [super init];
    if (self) {
        self.type = IM_SEND_SEND_MESSAGE;
    }
    return self;
}

- (NSData *)createJson
{
    NSMutableDictionary *msg = [NSMutableDictionary dictionary];
    [msg setObject:[NSNumber numberWithInt:self.megType] forKey:@"type"];
    [msg setObject:self.megid forKey:@"megid"];
    [msg setObject:self.content forKey:@"content"];
    [msg setObject:self.receiver forKey:@"receiver"];
    [msg setObject:self.receiverServerid forKey:@"receiverServerid"];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:msg, nil];
    [_rootDict setObject:array forKey:@"messages"];
    return [super createJson];
}

@end
