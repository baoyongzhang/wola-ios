//
//  TransmitMessageTests.m
//  TransmitMessageTests
//
//  Created by Baoyongzhang on 13-10-12.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMConversationDao.h"
#import "TMConversation.h"

@interface TransmitMessageTests : XCTestCase

@end

@implementation TransmitMessageTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConversationUpdate
{
    TMConversationDao *dao = [[TMConversationDao alloc] init];
    TMConversation *bean = [[TMConversation alloc] init];
    bean.target = @"13716307472";
    bean.targetName = @"张三33";
    bean.msgType = 2;
    bean.content = @"hhhhhhh好啊";
    bean.date = 89899;
    bean.isRead = YES;
    BOOL flag = [dao update:bean];
    NSLog(@"result = %@", flag ? @"true" : @"false");
}
- (void)testConversationDelete
{
    TMConversationDao *dao = [[TMConversationDao alloc] init];
    TMConversation *bean = [[TMConversation alloc] init];
    bean.target = @"13716307470";
    bean.targetName = @"张三33";
    bean.msgType = 2;
    bean.content = @"hhhhhhh好啊";
    bean.date = 89899;
    bean.isRead = YES;
    BOOL flag = [dao delete:bean];
    NSLog(@"result = %@", flag ? @"true" : @"false");
}

- (void)testConversationQuery
{
    TMConversationDao *dao = [[TMConversationDao alloc] init];
    NSMutableArray *list = [dao queryAll];
    for (TMConversation *bean in list) {
        NSLog(@"%@", bean);
    }
}

@end
