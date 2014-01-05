//
//  TMMessageDao.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-7.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMMessageDao.h"
#import "TMDB.h"
#import "TMMessage.h"

@implementation TMMessageDao

- (NSMutableArray *)queryByTarget:(NSString *)target start:(int)start
{
    return [TMDB execQuery:DB_MESSAGES callback:^id(FMDatabase *db) {
        NSMutableArray *list = [NSMutableArray array];
        FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ where 'target'=? limit ?,20", TABLE_MESSAGES], target, [NSNumber numberWithInt:start]];
        while ([rs next]) {
            // 填充对象
            [list addObject:[self fillData:rs]];
        }
        return list;
    }];
}

- (BOOL)insert:(TMMessage *)bean
{
    return [TMDB execUpdate:DB_MESSAGES callback:^BOOL(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO '%@' VALUES(NULL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", TABLE_MESSAGES];
        return [db executeUpdate:sql, bean.megid, bean.target, bean.sender, bean.receiver, [NSNumber numberWithInt:bean.msgType], [NSNumber numberWithInt:bean.contentType], [NSNumber numberWithLong:bean.date], bean.content, bean.content2, bean.content3, [NSNumber numberWithBool:bean.isRead], [NSNumber numberWithBool:bean.isSend], [NSNumber numberWithLong:bean.readTime], [NSNumber numberWithBool:bean.isShowTime], [NSNumber numberWithBool:bean.isService], [NSNumber numberWithLong:bean.serviceTime], [NSNumber numberWithBool:bean.isSendError]];
    }];
}

- (BOOL)delete:(TMMessage *)bean
{
    // 通过megid和target来删除
    return [TMDB execUpdate:DB_MESSAGES callback:^BOOL(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"DELETE FROM '%@' WHERE 'megid'=? and 'target'=?", TABLE_MESSAGES];
        return [db executeUpdate:sql, bean.megid, bean.target];
    }];
}

- (TMMessage *) fillData:(FMResultSet *) rs
{
    TMMessage *bean = [[TMMessage alloc] init];
    bean.id = [rs intForColumnIndex:0];
    bean.megid = [rs stringForColumnIndex:1];
    bean.target = [rs stringForColumnIndex:2];
    bean.sender = [rs stringForColumnIndex:3];
    bean.receiver = [rs stringForColumnIndex:4];
    bean.msgType = [rs intForColumnIndex:5];
    bean.contentType = [rs intForColumnIndex:6];
    bean.date = [rs longForColumnIndex:7];
    bean.content = [rs stringForColumnIndex:8];
    bean.content2 = [rs stringForColumnIndex:9];
    bean.content3 = [rs stringForColumnIndex:10];
    bean.isRead = [rs boolForColumnIndex:11];
    bean.isSend = [rs boolForColumnIndex:12];
    bean.readTime = [rs longForColumnIndex:13];
    bean.isShowTime = [rs boolForColumnIndex:14];
    bean.isService = [rs boolForColumnIndex:15];
    bean.serviceTime = [rs longForColumnIndex:16];
    bean.isSendError = [rs boolForColumnIndex:17];
    return bean;
}

@end
