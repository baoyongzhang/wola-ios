//
//  TMGetNewServerResponse.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-23.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMResponse.h"

@interface TMGetNewServerResponse : TMResponse

@property(nonatomic, strong) NSString *webServer;
@property(nonatomic, strong) NSString *webServerPort;
@property(nonatomic, strong) NSString *IMServer;
@property(nonatomic, strong) NSString *IMServerPort;
@property(nonatomic, strong) NSString *backupWebServer;
@property(nonatomic, strong) NSString *backupWebServerPort;
@property(nonatomic, strong) NSString *backupIMServer;
@property(nonatomic, strong) NSString *backupIMServerPort;

@end
