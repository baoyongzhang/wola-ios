//
//  NSData+AES.h
//  TestAES
//
//  Created by Baoyongzhang on 13-10-18.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonKeyDerivation.h>

#define AES_KEY @"cx@hy!*&y.)x#[;>"
#define AES_IV @"0102030405060708"

@interface NSData (AES)

+ (NSString *) AESEncryptWithData:(NSData *) data;
+ (NSData *) AESDecryptWithText:(NSString *) text;

@end
