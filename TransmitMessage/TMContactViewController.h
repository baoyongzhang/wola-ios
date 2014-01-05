//
//  TMContactViewController.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-13.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBaseViewController.h"

@interface TMContactViewController : TMBaseViewController <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tableView;
}

@end
