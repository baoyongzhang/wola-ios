//
//  TMRequest.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

// 请求类型
#define TYPE_ACCOUNT_VERIFY @"accountVerify"
#define TYPE_REGISTER @"register"
#define TYPE_IS_ACTIVED @"isActived"
#define TYPE_GET_USER_STATE @"getUserState"
#define TYPE_GET_LEAVEWORD_STATE @"getLeavewordState"
#define TYPE_UPDATE_LEAVEWORD_STATE @"updateLeavewordState"
#define TYPE_UPDATE_CUSTOM_LEAVEWORD_STATE @"uploadLeaveWordFile"
#define TYPE_GET_STANDARD_TIME @"getStandardTime"
#define TYPE_SEND_SUGGESTION @"sendSuggestion"
#define TYPE_GET_VERSION_UPDATE @"getVersionUpdate"
#define TYPE_GET_LEAVEWORD_LIST @"getLeavewordList"
#define TYPE_WEB_PASSWORD @"webPasReq"
#define TYPE_SEND_GROUP_MEG @"sendGroupMeg"
#define TYPE_GET_ALL_CODE_ORDER_TYPE @"getAllCodeOrderType"
#define TYPE_CHECK_UP_VERSION @"checkUpVersion"
#define TYPE_GET_NEW_SERVER @"getNewServer"
#define TYPE_EXCEPTION_UPDATE @"exceptionUpdate"
#define TYPE_UNINSTALL @"uninstall"
#define TYPE_GET_WEB_SITE @"getCommonWebsite"
#define TYPE_STEALTH @"stealth"
#define TYPE_GET_TURNCODE @"getTurnCode"
#define TYPE_UPLOAD_PHONEMODEL @"uploadPhoneModel"
#define TYPE_GET_BLESSING @"getBlessing"
#define TYPE_GET_GREETING @"getGreeting"
#define TYPE_TIMING_LEAVEWORD @"timingLeaveWord"
#define TYPE_GET_LEAVEWORD_FILEURL @"getLeaveWordFileUrl"

@interface TMRequest : NSObject

@property(nonatomic, assign) int result;

- (NSString *) createJson;

@end
