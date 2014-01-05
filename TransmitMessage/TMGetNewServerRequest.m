//
//  TMGetNewServerRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMGetNewServerRequest.h"

@implementation TMGetNewServerRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_GET_NEW_SERVER;
    }
    return self;
}

@end
