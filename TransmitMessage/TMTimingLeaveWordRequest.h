//
//  TMTimingLeaveWordRequest.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMRequest.h"

@interface TMTimingLeaveWordRequest : TMRequest

@property (nonatomic, assign) int dataType;
@property (nonatomic, assign) long timingid;
@property (nonatomic, assign) int leavewordStateNum;
@property (nonatomic, assign) int leavewordTime;
@property (nonatomic, assign) int beginTime;
@property (nonatomic, assign) int week;

- (id) initWithIsCancel:(BOOL) isCancel;

@end
