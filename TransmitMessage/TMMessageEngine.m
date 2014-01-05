//
//  TMMessageEngine.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-24.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMMessageEngine.h"
#import "TMMessage.h"
#import "TMConversation.h"

@implementation TMMessageEngine

+ (NSMutableArray *)queryConversationList
{
    NSMutableArray *list = [NSMutableArray array];
    
    for (int i = 0; i < 20; i++) {
        TMConversation *bean = [[TMConversation alloc] init];
        bean.target = [NSString stringWithFormat:@"131313131%i", i];
        bean.targetName = [NSString stringWithFormat:@"test%i", i];
        bean.content = @"测试测试测试测试";
        bean.msgType = [NSNumber numberWithInt:(i % 3) + 1];
        [list addObject:bean];
    }
    
    return list;
}

+ (NSMutableArray *)queryMessagesByTarget:(NSString *)target
{
    NSMutableArray *list = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        TMMessage *bean = [[TMMessage alloc] init];
        bean.target = target;
        bean.content = @"测试测试测试测试";
        if((i % 2) == 0)
            bean.sender = target;
        [list addObject:bean];
    }
    return list;
}

@end
