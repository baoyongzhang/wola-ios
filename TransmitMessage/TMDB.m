//
//  TMDB.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-6.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMDB.h"
#import "SysConfig.h"

@implementation TMDB

+ (void) execSql:(NSString *) dbPath callback:(void (^)(FMDatabase *db))block {
    FMDatabase *db = [FMDatabase databaseWithPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:dbPath]];
    if ([db open]) {
        @try {
            block(db); //调用block来回调实现具体的逻辑
        }
        @catch (NSException *exception) {
            NSLog(@"DB exec sql exception: %@", exception);
        }
        @finally {
            [db close];
        }
    } else {
        NSLog(@"db open failed, path:%@, errorMsg:%@", dbPath, [db lastErrorMessage]);
    }
    db = nil;
}


+ (BOOL) execUpdate:(NSString *) dbPath callback:(BOOL (^)(FMDatabase *db))block {
    BOOL flag = NO;
    FMDatabase *db = [FMDatabase databaseWithPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:dbPath]];
    if ([db open]) {
        @try {
            flag = block(db); //调用block来回调实现具体的逻辑
        }
        @catch (NSException *exception) {
            NSLog(@"DB exec sql exception: %@", exception);
        }
        @finally {
            [db close];
        }
    } else {
        NSLog(@"db open failed, path:%@, errorMsg:%@", dbPath, [db lastError]);
    }
    db = nil;
    return flag;
}

+ (id) execQuery:(NSString *) dbPath callback:(id (^)(FMDatabase *db))block {
    id obj = nil;
    FMDatabase *db = [FMDatabase databaseWithPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:dbPath]];
    if ([db open]) {
        @try {
            obj = block(db); //调用block来回调实现具体的逻辑
        }
        @catch (NSException *exception) {
            NSLog(@"DB exec sql exception: %@", exception);
        }
        @finally {
            [db close];
        }
    } else {
        NSLog(@"db open failed, path:%@, errorMsg:%@", dbPath, [db lastError]);
    }
    db = nil;
    return obj;
}

+ (void)initTable
{
    // 创建消息数据库表
    [self execSql:DB_MESSAGES callback:^(FMDatabase *db) {
        // 会话表
        NSString *conversationSql = [NSString stringWithFormat:@"CREATE TABLE '%@' ('_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'target' VARCHAR(50) UNIQUE, 'target_name' VARCHAR(50), 'msg_type' INTEGER, 'date' LONG, 'content' TEXT, 'is_read' INTEGER)", TABLE_CONVERSAION];
        [db executeUpdate:conversationSql];
        // 消息表
        NSString *msgSql = [NSString stringWithFormat:@"CREATE TABLE '%@' ('_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'megid' VARCHAR(50), 'target' VARCHAR(50), 'sender' VARCHAR(100), 'receiver' VARCHAR(50), 'msg_type' INTEGER, 'type' INTEGER, 'date' LONG, 'content' TEXT, 'content2' TEXT, 'content3' TEXT, 'is_read' INTEGER, 'is_send INTEGER', 'read_time' LONG, 'is_show_time' INTEGER, 'is_service' INTEGER, 'service_time' LONG, is_send_error INTEGER)", TABLE_MESSAGES];
        [db executeUpdate:msgSql];

    }];
    
    [self execSql:DB_LWMSG callback:^(FMDatabase *db) {
        // 留言消息表
        NSString *lwmsgSql = [NSString stringWithFormat:@"CREATE TABLE '%@' ('_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'megid' VARCHAR(50), 'target' VARCHAR(50), 'target_name' VARCHAR(50), 'type' INTEGER, 'date' LONG, 'content' TEXT, 'is_read' INTEGER, 'is_cs' INTEGER)", TABLE_LWMSG];
        [db executeUpdate:lwmsgSql];
    }];
    
    debugLog(@"初始化数据库完毕.");
    
}

@end
