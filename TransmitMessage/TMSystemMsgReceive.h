//
//  TMSystemMsgReceive.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-6.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMReceive.h"

@interface TMSystemMsgReceive : TMReceive

@property (nonatomic, strong) NSString *megid;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSNumber *megTime;
@property (nonatomic, strong) NSMutableArray *config;

@end
