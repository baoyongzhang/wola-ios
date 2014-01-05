//
//  TMContact.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-27.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMContact : NSObject

@property (nonatomic,strong) NSString * firstName;
@property (nonatomic,strong) NSString * lastName;
@property (nonatomic,strong) NSString * compositeName;
@property (nonatomic,strong) UIImage * image;
@property (nonatomic,strong) NSMutableDictionary * phoneInfo;
@property (nonatomic,strong) NSMutableDictionary * emailInfo;
@property (nonatomic,assign) int recordID;
@property (nonatomic,assign) int sectionNumber;

@end
