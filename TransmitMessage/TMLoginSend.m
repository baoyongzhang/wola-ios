//
//  TMLoginSend.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMLoginSend.h"

@implementation TMLoginSend

- (id)init
{
    self = [super init];
    if (self) {
        self.type = IM_SEND_LOGIN;
    }
    return self;
}

@end
