//
//  TMGetLeavewordStateResponse.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-23.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMResponse.h"

@interface TMGetLeavewordStateResponse : TMResponse

@property (nonatomic, strong) NSString *leavewordState;
@property (nonatomic, strong) NSNumber *leavewordTime;
@property (nonatomic, strong) NSNumber *standardTime;
@property (nonatomic, strong) NSNumber *leavewordStateNum;

- (void) setTimingList:(NSArray *) list;

@end
