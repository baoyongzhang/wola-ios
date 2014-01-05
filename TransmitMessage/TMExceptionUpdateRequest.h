//
//  TMExceptionUpdateRequest.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMRequest.h"

@interface TMExceptionUpdateRequest : TMRequest

@property (nonatomic, assign) float versionCode;
@property (nonatomic, strong) NSString *phoneModel;
@property (nonatomic, strong) NSString *phoneVersion;
@property (nonatomic, strong) NSString *userInfo;
@property (nonatomic, strong) NSString *exceptionContent;
@property (nonatomic, assign) long date;

@end
