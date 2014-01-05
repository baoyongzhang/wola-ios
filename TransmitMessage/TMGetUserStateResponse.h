//
//  TMGetUserStateResponse.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-23.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMResponse.h"

@interface TMGetUserStateResponse : TMResponse

@property (nonatomic, strong) NSNumber *isOrderUser;
@property (nonatomic, strong) NSNumber *isOnline;
@property (nonatomic, strong) NSString *leavewordState;
@property (nonatomic, strong) NSNumber *leavewordStateNum;
@property (nonatomic, strong) NSString *serverid;
@property (nonatomic, strong) NSString *leavewordUrl;

@end
