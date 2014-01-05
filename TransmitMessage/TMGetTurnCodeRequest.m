//
//  TMGetTurnCodeRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMGetTurnCodeRequest.h"

@implementation TMGetTurnCodeRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_GET_TURNCODE;
    }
    return self;
}

@end
