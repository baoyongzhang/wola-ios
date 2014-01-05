//
//  TMLeavewordViewController.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMLeavewordViewController.h"

@interface TMLeavewordViewController ()

@end

@implementation TMLeavewordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"留言状态";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 获取留言列表
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
    [_list release];
    _list = nil;
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
    static NSString * identifier=@"leavewordCell";
    WCRecentListCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[[WCRecentListCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier]autorelease];
    }
    WCMessageUserUnionObject *unionObject=[_msgArr objectAtIndex:indexPath.row];
    [cell setUnionObject:unionObject];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WCSendMessageController *sendView=[[[WCSendMessageController alloc]init]autorelease];
    
    WCMessageUserUnionObject *unionObj=[_msgArr objectAtIndex:indexPath.row];
    
    [sendView setChatPerson:unionObj.user];
    [sendView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:sendView animated:YES];
}

@end
