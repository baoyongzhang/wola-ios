//
//  TMMessageViewController.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-13.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMMessageViewController.h"
#import "TMLeaveword.h"
#import "TMLeavewordEngine.h"
#import "TMLeavewordViewController.h"

@interface TMMessageViewController ()

@end

@implementation TMMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"消息";
        self.tabBarItem.image = [UIImage imageNamed:@"icon_message_normal"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 初始化留言板
    [self initLeaveword];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
    self.leaveword = nil;
}

#pragma mark - 事件

- (void)forwardLeaveword:(id)sender
{
    // 进入留言设置页面
    TMLeavewordViewController *vc = [[TMLeavewordViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

#pragma mark - 私有方法

- (void) initLeaveword
{
    self.leaveword = [TMLeavewordEngine getCurrentState];
    // 显示留言信息
    UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(29, 42, 0, 0)];
    info.text = self.leaveword.info;
    info.numberOfLines = 1;
    info.font = [UIFont fontWithName:info.font.fontName size:13];
    [info sizeToFit];
    [self.view addSubview:info];
    [info release];
    // 显示时间
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(0, 58, self.view.frame.size.width - 20, 20)];
    [time setTextAlignment:UITextAlignmentRight];
    time.backgroundColor = [UIColor clearColor];
    time.textColor = [UIColor colorWithRed:0 green:140 blue:211 alpha:255];
    time.text = @"10:45结束";
    time.numberOfLines = 1;
    time.font = [UIFont fontWithName:info.font.fontName size:13];
//    [time sizeToFit];
    [self.view addSubview:time];
    [time release];
    
}

@end
