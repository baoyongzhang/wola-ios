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
#import "TMConversationCell.h"
#import "TMMessageEngine.h"
#import "TMConversation.h"
#import "TMUtils.h"
#import "TMChatViewController.h"

extern NSString* CTSIMSupportCopyMobileSubscriberIdentity();

@interface TMMessageViewController ()

@end

@implementation TMMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"消息";
        UIImage *icon = [UIImage imageNamed:@"icon_message_normal"];
        
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
    self.list = [TMMessageEngine queryConversationList];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    NSLog(@"imsi = %@", CTSIMSupportCopyMobileSubscriberIdentity());
    NSLog(@"exists simcard = %d", [TMUtils existSimCard]);
    [TMUtils getIMSI];
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://10086"]];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://**67*13041184196%23"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 事件

- (void)forwardLeaveword:(id)sender
{
    // 进入留言设置页面
    TMLeavewordViewController *vc = [[TMLeavewordViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
    [self.view addSubview:info];    // 显示时间
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(0, 58, self.view.frame.size.width - 20, 20)];
    [time setTextAlignment:UITextAlignmentRight];
    time.backgroundColor = [UIColor clearColor];
    time.textColor = [UIColor colorWithRed:0 green:140 blue:211 alpha:255];
    time.text = @"10:45结束";
    time.numberOfLines = 1;
    time.font = [UIFont fontWithName:info.font.fontName size:13];
//    [time sizeToFit];
    [self.view addSubview:time];
}

#pragma mark   ---------tableView协议----------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _list.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier=@"conversationCell";
    TMConversationCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[TMConversationCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    TMConversation *bean = [_list objectAtIndex:indexPath.row];
    // 设置当前显示的数据
    [cell setBean:bean];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMConversation *bean = [self.list objectAtIndex:indexPath.item];
    TMChatViewController *chat = [[TMChatViewController alloc] init];
    chat.conversation = bean;
    chat.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chat animated:YES];
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
