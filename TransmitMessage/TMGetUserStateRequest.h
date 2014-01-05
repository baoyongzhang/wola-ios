//
//  TMGetUserStateRequest.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMRequest.h"

@interface TMGetUserStateRequest : TMRequest

@property (nonatomic, strong) NSString *queryPhoneNumber;

@end
