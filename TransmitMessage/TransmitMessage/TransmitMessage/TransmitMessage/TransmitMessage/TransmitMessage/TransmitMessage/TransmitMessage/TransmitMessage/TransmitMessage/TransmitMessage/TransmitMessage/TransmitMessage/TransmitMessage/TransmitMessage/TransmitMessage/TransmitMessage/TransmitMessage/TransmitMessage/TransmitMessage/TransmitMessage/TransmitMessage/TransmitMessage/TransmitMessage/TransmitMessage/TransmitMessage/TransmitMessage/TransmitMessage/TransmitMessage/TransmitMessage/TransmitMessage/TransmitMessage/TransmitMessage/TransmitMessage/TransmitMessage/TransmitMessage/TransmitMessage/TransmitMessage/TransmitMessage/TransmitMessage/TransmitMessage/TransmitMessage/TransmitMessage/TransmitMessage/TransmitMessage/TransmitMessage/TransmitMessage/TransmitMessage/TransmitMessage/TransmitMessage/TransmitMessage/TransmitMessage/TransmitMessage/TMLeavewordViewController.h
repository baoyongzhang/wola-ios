//
//  TMLeavewordViewController.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMLeavewordViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *_tableView;
    NSMutableArray *_list;
}
@end
