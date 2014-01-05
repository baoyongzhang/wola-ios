//
//  TMServiceReceive.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-6.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMReceive.h"

@interface TMServiceReceive : TMReceive

@property (nonatomic, strong) NSString *receiver;
@property (nonatomic, strong) NSString *sender;
@property (nonatomic, strong) NSString *megid;
@property (nonatomic, strong) NSNumber *date;

@end
