//
//  KsiMD5Util.h
//  WhoyaoClientProject
//
//  Created by Reuniontech on 12-11-12.
//  Copyright (c) 2012年 Reuniontech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindActDisplayModel.h"

@interface KsiMD5Util : NSObject

+(NSString *) MD5:(NSString *)md5Str;

+(NSString *)NewMD5:(NSString*)md5Str;

//获得String的MD5值
+(NSString *)getMD5WithString:(NSString *)string;

//获得文件的MD5值
+(NSString*)getMD5WithFilePath:(NSString*)filePath;

+ (FindActDisplayModel*)getModel;

@end
