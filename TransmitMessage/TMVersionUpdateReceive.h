//
//  TMVersionUpdateReceive.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-6.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMReceive.h"

@interface TMVersionUpdateReceive : TMReceive

@property (nonatomic, strong) NSNumber *versionUpdate;
@property (nonatomic, strong) NSNumber *versionCode;
@property (nonatomic, strong) NSString *updateUrl;
@property (nonatomic, strong) NSString *updateContent;
@property (nonatomic, strong) NSNumber *date;

@end
