//
//  TMSend.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-11-5.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMSend.h"
#import "NSData+AES.h"
#import "TMConfig.h"

@implementation TMSend

- (id)init
{
    self = [super init];
    if (self) {
        _rootDict = [NSMutableDictionary dictionary];
        self.SIMSerialNumber = [TMConfig getString:SIM_SERIAL_NUMBER];
        self.phoneNumber = [TMConfig getString:PHONE_NUMBER];
    }
    return self;
}

// 添加请求字段
- (void)addKey:(NSString *)key value:(NSObject *)value
{
    if(!_dict){
        _dict = [NSMutableDictionary dictionary];
    }
    [_dict setObject:value forKey:key];
}

- (void)addKey:(NSString *)key int:(int)value
{
    [self addKey:key value:[NSNumber numberWithInt:value]];
}

- (void)addKey:(NSString *)key float:(float)value
{
    [self addKey:key value:[NSNumber numberWithFloat:value]];
}

- (void)addKey:(NSString *)key long:(long)value
{
    [self addKey:key value:[NSNumber numberWithLong:value]];
}

// 创建json
- (NSData *)createJson
{
    if(self.SIMSerialNumber){
        [self addKey:@"SIMSerialNumber" value:self.SIMSerialNumber];
    }
    if(self.phoneNumber){
        [self addKey:@"phoneNumber" value:self.phoneNumber];
    }
    
    [_rootDict setObject:_dict forKey:@"data"];
    [_rootDict setObject:[NSNumber numberWithInt:self.type] forKey:@"type"];
    NSData *data = nil;
    if([NSJSONSerialization isValidJSONObject:_rootDict]){
        NSError *error = nil;
        data = [NSJSONSerialization dataWithJSONObject:_rootDict options:NSJSONWritingPrettyPrinted error:&error];
        if(error){
            data = nil;
        }else{
            NSLog(@"im send = %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            NSString *str = [[NSData AESEncryptWithData:data] stringByAppendingString:@"\r\n"];
            return [str dataUsingEncoding:NSUTF8StringEncoding];
        }
    }
    return data;
}

@end
