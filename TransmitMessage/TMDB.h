//
//  TMDB.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-6.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabasePool.h"
#import "FMDatabaseQueue.h"
#import "FMResultSet.h"

#define PATH_OF_DOCUMENT [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define DB_MESSAGES @"messages.db"
#define DB_LWMSG @"lwmsg.db"
#define DB_CALLLOG @"calllog.db"

#define TABLE_CONVERSAION @"conversation"
#define TABLE_MESSAGES @"messages"
#define TABLE_LWMSG @"lwmsg"
#define TABLE_CALLLOG @"calllog"

@interface TMDB : NSObject

+ (void) execSql:(NSString *) dbPath callback:(void (^)(FMDatabase *db))block;
+ (BOOL) execUpdate:(NSString *) dbPath callback:(BOOL (^)(FMDatabase *db))block;
+ (id) execQuery:(NSString *) dbPath callback:(id (^)(FMDatabase *db))block;
+ (void) initTable;

@end
