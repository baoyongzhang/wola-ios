//
//  TMMessageEngine.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-24.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMMessageEngine : NSObject

+ (NSMutableArray *) queryConversationList;
+ (NSMutableArray *) queryMessagesByTarget:(NSString *)target;

@end
