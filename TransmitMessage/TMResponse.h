//
//  TMResponse.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FAIL 0
#define SUCCESS 1

@interface TMResponse : NSObject

+ (TMResponse *) responseWithType:(NSString *)reqType respJson:(NSString *)respJson;

@end
