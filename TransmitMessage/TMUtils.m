//
//  TMUtils.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMUtils.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation TMUtils

+ (NSString *) getIMSI
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = info.subscriberCellularProvider;
    info.subscriberCellularProviderDidUpdateNotifier = ^(CTCarrier *carrier)
    {
            NSLog(@"carrier:%@", [carrier description]);
    };
    NSLog(@"carrier:%@", [carrier description]);
//    carrier.
    return @"460011110000001";
}

+(NSString *)getVersionCode
{
    NSDictionary* infoDict =[[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:@"CFBundleVersion"];
}

+(BOOL)existSimCard
{
    return [CTSIMSupportGetSIMStatus() isEqualToString:kCTSIMSupportSIMStatusNotInserted];
}

@end
