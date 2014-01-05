//
//  TMCheckUpVersionResponse.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-23.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMResponse.h"

@interface TMCheckUpVersionResponse : TMResponse

@property (nonatomic, strong) NSNumber *versionUpdate;
@property (nonatomic, strong) NSNumber *versionCode;
@property (nonatomic, strong) NSString *updateUrl;
@property (nonatomic, strong) NSString *updateContent;
@property (nonatomic, strong) NSNumber *date;

@end
