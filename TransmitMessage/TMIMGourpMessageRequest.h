//
//  TMIMGourpMessageRequest.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMRequest.h"

@interface TMIMGourpMessageRequest : TMRequest

@property (nonatomic, strong) NSString *receivers;
@property (nonatomic, strong) NSString *megid;
@property (nonatomic, strong) NSString *content;

@end
