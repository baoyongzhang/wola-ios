//
//  TMRequest.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMRequest.h"
#import "NSData+AES.h"

@implementation TMRequest

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
        NSLog(@"%@", self.SIMSerialNumber);
        [self addKey:@"SIMSerialNumber" value:self.SIMSerialNumber];
    }
    if(self.phoneNumber)
        [self addKey:@"phoneNumber" value:self.phoneNumber];
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    [dict setObject:_dict forKey:@"data"];
    [dict setObject:self.type forKey:@"type"];
    NSData *data = nil;
    if([NSJSONSerialization isValidJSONObject:dict]){
        NSError *error = nil;
        data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
        if(error){
            data = nil;
        }else{
            NSLog(@"request json = %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            NSString *str = [NSData AESEncryptWithData:data];
            return [str dataUsingEncoding:NSUTF8StringEncoding];
        }
    }
    return data;
}

@end
