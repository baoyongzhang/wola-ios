//
//  TMSendReceive.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-6.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMReceive.h"

@interface TMSendReceive : TMReceive

@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSNumber *pushResult;
@property (nonatomic, strong) NSString *megid;

@end
