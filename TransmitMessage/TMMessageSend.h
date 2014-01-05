//
//  TMMessageSend.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMSend.h"

@interface TMMessageSend : TMSend

@property (nonatomic, assign) int megType;
@property (nonatomic, strong) NSString *megid;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *receiver;
@property (nonatomic, strong) NSString *receiverServerid;

@end
