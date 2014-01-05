//
//  TMMessage.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-24.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMMessage : NSObject

@property (nonatomic, assign) int id;
@property (nonatomic, strong) NSString *megid;
@property (nonatomic, strong) NSString *target;
@property (nonatomic, strong) NSString *sender;
@property (nonatomic, strong) NSString *receiver;
@property (nonatomic, assign) int msgType;
@property (nonatomic, assign) int contentType;
@property (nonatomic, assign) long date;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *content2;
@property (nonatomic, strong) NSString *content3;
@property (nonatomic, assign) BOOL isRead;
@property (nonatomic, assign) BOOL isSend;
@property (nonatomic, assign) long readTime;
@property (nonatomic, assign) BOOL isShowTime;
@property (nonatomic, assign) BOOL isService;
@property (nonatomic, assign) long serviceTime;
@property (nonatomic, assign) BOOL isSendError;

@end
