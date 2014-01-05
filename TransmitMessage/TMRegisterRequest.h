//
//  TMRegisterRequest.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMRequest.h"

@interface TMRegisterRequest : TMRequest

@property (nonatomic, strong) NSString *companyid;
@property (nonatomic, strong) NSString *systemVersion;
@property (nonatomic, strong) NSString *phoneModel;

@end
