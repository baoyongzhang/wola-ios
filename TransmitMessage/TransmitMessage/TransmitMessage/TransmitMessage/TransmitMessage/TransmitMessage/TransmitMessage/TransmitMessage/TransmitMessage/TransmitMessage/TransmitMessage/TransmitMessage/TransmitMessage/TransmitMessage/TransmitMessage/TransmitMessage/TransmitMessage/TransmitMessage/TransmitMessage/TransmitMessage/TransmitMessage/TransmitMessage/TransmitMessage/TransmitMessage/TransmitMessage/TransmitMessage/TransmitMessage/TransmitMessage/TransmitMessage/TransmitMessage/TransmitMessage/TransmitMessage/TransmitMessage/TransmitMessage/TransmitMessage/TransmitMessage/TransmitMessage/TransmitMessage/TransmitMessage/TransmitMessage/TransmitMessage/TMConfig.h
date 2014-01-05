//
//  TMConfig.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMConfig : NSObject

+ (int) getInt:(NSString *) key;
+ (void) putInt:(NSString *) key value:(NSString *) value;
+ (long) getLong:(NSString *) key;
+ (void) putLong:(NSString *) key value:(NSString *) value;
+ (NSString *) getString:(NSString *) key;
+ (void) putString:(NSString *) key value:(NSString *) value;

+ (NSString *) getWebUrl;
+ (NSString *) getCenterURl;

@end
