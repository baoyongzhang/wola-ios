//
//  TMConfig.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMConfig.h"
#import "TMDB.h"

@implementation TMConfig

// 判断配置文件是否存在
+ (BOOL)isExistConfigFile
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:CONFIG_PATH]) {
        return YES;
    }else{
        return NO;
    }
}

// 创建配置文件
+ (void)createConfigFile
{
    NSMutableDictionary *plist = [[NSMutableDictionary alloc] init];
    [plist setObject:@"init" forKey:@"init"];
    [plist writeToFile:CONFIG_PATH atomically:YES];
    
    // 初始化数据库
    [TMDB initTable];
}

// 读取字符串
+ (NSString *)getString:(NSString *)key
{
    if([key isEqualToString:SIM_SERIAL_NUMBER])
        return @"460011184001337";
    if([key isEqualToString:PHONE_NUMBER])
        return @"13041184196";
    NSDictionary *plist = [[[NSDictionary alloc]initWithContentsOfFile:CONFIG_PATH]mutableCopy];
    return [plist objectForKey:key];
}

// 添加字符串
+ (void)putString:(NSString *)key value:(NSString *)value
{
    NSMutableDictionary *plist = [[[NSMutableDictionary alloc]initWithContentsOfFile:CONFIG_PATH]mutableCopy];
    [plist setObject:value forKey:key];
    [plist writeToFile:CONFIG_PATH atomically:YES];
}

+ (int)getInt:(NSString *)key
{
    NSDictionary *plist = [[[NSDictionary alloc]initWithContentsOfFile:CONFIG_PATH]mutableCopy];
    NSNumber *number = [plist objectForKey:key];
    return [number intValue];
}

+ (void)putInt:(NSString *)key value:(int)value
{
    NSMutableDictionary *plist = [[[NSMutableDictionary alloc]initWithContentsOfFile:CONFIG_PATH]mutableCopy];
    [plist setObject:[NSNumber numberWithInt:value] forKey:key];
    [plist writeToFile:CONFIG_PATH atomically:YES];
}

+ (long)getLong:(NSString *)key
{
    NSDictionary *plist = [[[NSDictionary alloc]initWithContentsOfFile:CONFIG_PATH]mutableCopy];
    NSNumber *number = [plist objectForKey:key];
    return [number longValue];
}

+ (void)putLong:(NSString *)key value:(long)value
{
    NSMutableDictionary *plist = [[[NSMutableDictionary alloc]initWithContentsOfFile:CONFIG_PATH]mutableCopy];
    [plist setObject:[NSNumber numberWithLong:value] forKey:key];
    [plist writeToFile:CONFIG_PATH atomically:YES];
}

+ (BOOL)getBool:(NSString *)key
{
    return [self getInt:key] == 1 ? YES : NO;
}

+ (void)putBool:(NSString *)key value:(BOOL)value
{
    [self putInt:key value:value ? 1 : 0];
}

+ (NSString *)getCenterServerURl
{
    return @"http://www.laihuatong.com:9191/CenterServer/requestEntry.action";
}

+ (NSString *)getWebServerUrl
{
    return [NSString stringWithFormat:@"http://%@:%@/LinkServer/clientReqAction.action", [self getString:WEB_SERVER], [self getString:WEB_SERVER_PORT]];
}

@end
