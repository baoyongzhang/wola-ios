//
//  TMMessageDao.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-7.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMMessage;

@interface TMMessageDao : NSObject

- (BOOL) insert:(TMMessage *) bean;
- (NSMutableArray *) queryByTarget:(NSString *) target start:(int) start;
- (BOOL) delete:(TMMessage *) bean;

@end
