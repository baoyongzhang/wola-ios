//
//  TMMessageViewController.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-13.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBaseViewController.h"

@class TMLeaveword;

@interface TMMessageViewController : TMBaseViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *_tableView;
}

@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, strong) TMLeaveword * leaveword;

-(IBAction) forwardLeaveword:(id)sender;

@end
