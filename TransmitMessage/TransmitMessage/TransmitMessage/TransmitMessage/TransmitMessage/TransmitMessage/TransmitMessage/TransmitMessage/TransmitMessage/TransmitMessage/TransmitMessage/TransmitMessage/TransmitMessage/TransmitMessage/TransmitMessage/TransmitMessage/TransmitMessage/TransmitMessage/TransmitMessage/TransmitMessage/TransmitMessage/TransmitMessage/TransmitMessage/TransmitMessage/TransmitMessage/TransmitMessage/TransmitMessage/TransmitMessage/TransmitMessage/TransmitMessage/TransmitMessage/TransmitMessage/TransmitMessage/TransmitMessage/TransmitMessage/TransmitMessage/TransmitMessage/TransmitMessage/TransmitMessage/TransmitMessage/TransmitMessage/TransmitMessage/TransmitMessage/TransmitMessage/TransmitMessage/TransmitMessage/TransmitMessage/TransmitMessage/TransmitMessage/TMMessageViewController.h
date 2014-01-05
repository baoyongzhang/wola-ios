//
//  TMMessageViewController.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-13.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMLeaveword;

@interface TMMessageViewController : UIViewController

@property (nonatomic, retain) TMLeaveword * leaveword;

-(IBAction) forwardLeaveword:(id)sender;

@end
