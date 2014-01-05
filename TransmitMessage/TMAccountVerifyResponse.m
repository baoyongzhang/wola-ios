//
//  TMAccountVerifyResponse.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-22.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMAccountVerifyResponse.h"

@implementation TMAccountVerifyResponse

-(NSString *)description
{
    return [NSString stringWithFormat:@"isRegister = %@, isActived = %@, stealthtype = %@, webServer = %@, webServerPort = %@, IMServer = %@, IMServerPort = %@, backupWebServer = %@, backupWebServerPort = %@, backupIMServer = %@, backupIMServerPort = %@, callTurnCode = %@, phoneNumber = %@, introduce = %@", self.isRegister, self.isActived, self.stealthtype, self.webServer, self.webServerPort, self.IMServer, self.IMServerPort, self.backupWebServer, self.backupWebServerPort, self.backupIMServer, self.backupIMServerPort, self.callTurnCode, self.phoneNumber, self.introduce];
}

@end
