//
//  TMLeaveword.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMLeaveword : NSObject

@property (nonatomic, assign) int type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *info;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *selectedImage;

- (id) initWithType:(int)type name:(NSString *)name info:(NSString *)info image:(NSString *)image selectedImage:(NSString *)selectedImage;

@end
