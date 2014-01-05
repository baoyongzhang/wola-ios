//
//  TMLeaveword.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMLeaveword.h"

@implementation TMLeaveword

- (id)initWithType:(int)type name:(NSString *)name info:(NSString *)info image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    if(self = [super init]){
        self.name = name;
        self.info = info;
        self.image = image;
        self.selectedImage = selectedImage;
    }
    return self;
}

@end
