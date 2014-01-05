//
//  TMNetConnection.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMRequest;
@class TMResponse;

@interface TMNetConnection : NSObject

+ (BOOL) isNetworkAvailable;
+ (int) getNetworkType;
+ (void) requestCenterServer:(TMRequest *) req success:(void (^)(TMResponse *)) success faid:(void (^)(NSString *)) fail;
+ (void) requestWebServer:(TMRequest *) req success:(void (^)(TMResponse *)) success faid:(void (^)(NSString *)) fail;

@end
