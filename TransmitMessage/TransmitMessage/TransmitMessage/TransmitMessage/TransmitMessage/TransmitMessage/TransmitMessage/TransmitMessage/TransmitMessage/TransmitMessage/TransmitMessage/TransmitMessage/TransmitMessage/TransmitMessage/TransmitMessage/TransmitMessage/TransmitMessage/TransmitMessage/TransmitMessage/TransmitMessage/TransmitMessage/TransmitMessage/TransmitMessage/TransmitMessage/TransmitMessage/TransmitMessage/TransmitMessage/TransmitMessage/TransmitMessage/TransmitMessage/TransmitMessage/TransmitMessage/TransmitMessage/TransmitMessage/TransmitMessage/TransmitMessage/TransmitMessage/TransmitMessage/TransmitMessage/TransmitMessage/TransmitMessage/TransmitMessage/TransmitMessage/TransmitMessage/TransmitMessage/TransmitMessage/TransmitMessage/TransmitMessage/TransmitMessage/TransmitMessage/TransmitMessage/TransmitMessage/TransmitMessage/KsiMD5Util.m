//
//  KsiMD5Util.m
//  WhoyaoClientProject
//
//  Created by Reuniontech on 12-11-12.
//  Copyright (c) 2012年 Reuniontech. All rights reserved.
//

#import "KsiMD5Util.h"
#import "SysConfig.h"
#import <CommonCrypto/CommonDigest.h>

#define CHUNK_SIZE 1024.0f


@implementation KsiMD5Util


+(NSString *) MD5:(NSString *)md5Str
{
    //NSString *senMd5=[md5Str stringByAppendingString:@"`123qwe~!@#QWEqwe"];
    const char *src = [md5Str  UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(src, strlen(src), result);
    NSString * ret = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3],
                      result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11],
                      result[12], result[13], result[14], result[15]];
    return ret;
}

+(NSString*)NewMD5:(NSString *)md5Str
{
    NSString *senMd5=[md5Str stringByAppendingString:@"`123qwe~!@#QWEqwe"];
    const char *src = [senMd5  UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(src, strlen(src), result);
    NSString * ret = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3],
                      result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11],
                      result[12], result[13], result[14], result[15]];
    return ret;
}

//获得String的MD5值
+(NSString *)getMD5WithString:(NSString *)string{
    const char *ptr = [string UTF8String];
    
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    
    NSMutableString *oupput = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [oupput appendFormat:@"%02x",md5Buffer[i]];
    }
    
    return oupput;
}

//获得文件的MD5值
+(NSString*)getMD5WithFilePath:(NSString*)filePath{
	NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
	
	CC_MD5_CTX md5;
    
	CC_MD5_Init(&md5);
	
	BOOL done = NO;
	while(!done){
		NSData* fileData = [handle readDataOfLength: CHUNK_SIZE ];
		CC_MD5_Update(&md5, [fileData bytes], [fileData length]);
		if( [fileData length] == 0 ) done = YES;
	}
	unsigned char digest[CC_MD5_DIGEST_LENGTH];
	CC_MD5_Final(digest, &md5);
	NSString* md5Str = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                        digest[0], digest[1],
                        digest[2], digest[3],
                        digest[4], digest[5],
                        digest[6], digest[7],
                        digest[8], digest[9],
                        digest[10], digest[11],
                        digest[12], digest[13],
                        digest[14], digest[15]];
	return md5Str;
}

+ (FindActDisplayModel*)getModel
{
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[APPDELEGATE performSelector:@selector(dataActFilePath:) withObject:@"findAct.plist"]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    FindActDisplayModel *displayModel= [unarchiver decodeObjectForKey:@"findAct.plist"];
    [unarchiver finishDecoding];
    return displayModel;
}

@end
