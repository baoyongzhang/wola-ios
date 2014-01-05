//
//  TMLeavewordEngine.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMLeaveword;

@interface TMLeavewordEngine : NSObject

+ (TMLeaveword *) getCurrentState;
+ (NSDate *) getFinishTime;
+ (void) setFinish;
+ (NSMutableArray *) getAll;

@end
