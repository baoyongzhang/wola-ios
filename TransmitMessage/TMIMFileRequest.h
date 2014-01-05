//
//  TMIMFileRequest.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-21.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMRequest.h"

#define TYPE_AUDIO @"2"
#define TYPE_PICTURE @"3"
#define TYPE_OTHER @"4"

#define SEND_TYPE_ONE 1
#define SEND_TYPE_GROUP 2
#define SEND_TYPE_UPLOAD 3

@interface TMIMFileRequest : TMRequest

- (id) initWithType:(NSString *) type;

@property (nonatomic, strong) NSString *fileType;
@property (nonatomic, assign) int sendType;
@property (nonatomic, strong) NSString *sender;
@property (nonatomic, strong) NSString *receiver;
@property (nonatomic, strong) NSString *megid;
@property (nonatomic, strong) NSString *receiverServerid;

@end
