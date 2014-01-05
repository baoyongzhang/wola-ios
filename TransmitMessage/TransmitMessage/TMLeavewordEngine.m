//
//  TMLeavewordEngine.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMLeavewordEngine.h"
#import "TMLeaveword.h"

@implementation TMLeavewordEngine

+ (TMLeaveword *)getCurrentState
{
    TMLeaveword *bean = [[[TMLeaveword alloc] init] autorelease];
    bean.name = @"开车";
    bean.info = @"我正在开车，请给我留言";
    return bean;
}

+ (NSDate *)getFinishTime
{
    return [NSDate date];
}

+ (void)setFinish
{
}

+ (NSMutableArray *)getAll
{
    NSMutableArray *list = [NSMutableArray array];
    
    
    
    return list;
}

@end
