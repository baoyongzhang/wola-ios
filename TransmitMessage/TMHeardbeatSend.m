
//
//  TMHeardbeatSend.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMHeardbeatSend.h"

@implementation TMHeardbeatSend

- (id)init
{
    self = [super init];
    if (self) {
        self.type = IM_SEND_HEARDBEAT;
    }
    return self;
}

@end
