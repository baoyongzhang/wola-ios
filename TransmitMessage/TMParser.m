//
//  TMJsonParser.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-22.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMParser.h"

@implementation TMParser

+ (void)parseJson:(NSData *)json toObject:(NSObject *)obj
{
//    NSString * str = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
//    NSData *tempData = [[self parseUnicode:str] dataUsingEncoding:NSUTF8StringEncoding];
//    [str release];
    
//    NSLog(@"%@", [self parseUnicode:@"\\U6765"]);
    
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    [self parseDict:dict toObject:obj];
}

+ (void) parseDict:(NSDictionary *)dict toObject:(NSObject *) obj
{
    NSEnumerator *keyEnum = [dict keyEnumerator];
    id key;
    while(key = [keyEnum nextObject]){
        SEL sel = [self createSetName:key];
        if([obj respondsToSelector:sel]){
            id value = [dict objectForKey:key];
            [obj performSelector:sel withObject:value];
        }
    }

}

+ (SEL) createSetName:(NSString *)key
{
    NSString *capital = [[key substringToIndex:1] uppercaseString];
	NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:",capital,[key substringFromIndex:1]];
	return NSSelectorFromString(setterSelStr);
}

+ (NSString *) parseUnicode:(NSString *) str
{
    NSString *tempStr1 = [str stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    
    NSLog(@"Output = %@", returnStr);
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

@end
