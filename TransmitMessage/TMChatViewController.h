//
//  TMChatViewController.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-25.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBaseViewController.h"

@class TMConversation;

@interface TMChatViewController : TMBaseViewController <UITabBarDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) TMConversation *conversation;

@end
