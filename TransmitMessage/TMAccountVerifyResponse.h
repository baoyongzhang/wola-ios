//
//  TMAccountVerifyResponse.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-22.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMResponse.h"

#define NOT_REGISTER 0
#define REGISTERED 1

@interface TMAccountVerifyResponse : TMResponse

@property(nonatomic, strong) NSNumber *isRegister;
@property(nonatomic, strong) NSNumber *isActived;
@property(nonatomic, strong) NSNumber *stealthtype;
@property(nonatomic, strong) NSString *webServer;
@property(nonatomic, strong) NSNumber *webServerPort;
@property(nonatomic, strong) NSString *IMServer;
@property(nonatomic, strong) NSNumber *IMServerPort;
@property(nonatomic, strong) NSString *backupWebServer;
@property(nonatomic, strong) NSNumber *backupWebServerPort;
@property(nonatomic, strong) NSString *backupIMServer;
@property(nonatomic, strong) NSNumber *backupIMServerPort;
@property(nonatomic, strong) NSString *callTurnCode;
@property(nonatomic, strong) NSString *phoneNumber;
@property(nonatomic, strong) NSArray *introduce;

@end
