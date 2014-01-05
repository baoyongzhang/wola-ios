//
//  TMReceivedSend.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMSend.h"

@interface TMReceivedSend : TMSend

@property (nonatomic, strong) NSString *megid;
@property (nonatomic, strong) NSString *receiver;

@end
