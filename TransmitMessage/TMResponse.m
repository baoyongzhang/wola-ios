//
//  TMResponse.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMResponse.h"
#import "NSData+AES.h"
#import "TMRequest.h"
#import "TMParser.h"
#import "TMAccountVerifyResponse.h"

@implementation TMResponse

+ (TMResponse *)responseWithType:(NSString *)reqType respJson:(NSString *)respJson
{
    // 解密
    NSData *respData = [NSData AESDecryptWithText:respJson];
    NSLog(@"response json = %@", [[NSString alloc] initWithData:respData encoding:NSUTF8StringEncoding]);
    // 判断reqType，创建不同的响应对象
    TMResponse *resp = nil;
    if ([TYPE_ACCOUNT_VERIFY isEqualToString:reqType]) {
        resp = [[TMAccountVerifyResponse alloc] init];
    }else if([TYPE_REGISTER isEqualToString:reqType]) {
        resp = [[TMAccountVerifyResponse alloc] init];
    }else{
        resp = [[TMResponse alloc] init];
    }
    [TMParser parseJson:respData toObject:resp];
    return resp;
}

- (void)setData:(NSDictionary *)data
{
    // 解析
    [TMParser parseDict:data toObject:self];
}

@end
