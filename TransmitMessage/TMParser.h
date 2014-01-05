//
//  TMJsonParser.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-22.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMParser : NSObject

+ (void) parseJson:(NSData *)json toObject:(NSObject *)obj;
+ (SEL) createSetName:(NSString *)key;
+ (void) parseDict:(NSDictionary *)dict toObject:(NSObject *) obj;
+ (NSString *) parseUnicode:(NSString *) str;

@end
