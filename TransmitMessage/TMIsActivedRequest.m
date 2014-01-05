//
//  TMIsActivedRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMIsActivedRequest.h"

@implementation TMIsActivedRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.type = TYPE_IS_ACTIVED;
    }
    return self;
}

@end
