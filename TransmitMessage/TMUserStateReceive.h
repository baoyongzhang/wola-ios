//
//  TMUserStateReceive.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-6.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMReceive.h"

@interface TMUserStateReceive : TMReceive

@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSNumber *online;

@end
