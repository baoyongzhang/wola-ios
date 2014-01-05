//
//  TMLeavewordViewController.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBaseViewController.h"

@interface TMLeavewordViewController : TMBaseViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *_tableView;
}

@property (nonatomic, strong) NSMutableArray *list;
@end
