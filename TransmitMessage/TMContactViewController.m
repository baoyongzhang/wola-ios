//
//  TMContactViewController.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-13.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMContactViewController.h"

@interface TMContactViewController ()

@end

@implementation TMContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"联系人";
        self.tabBarItem.image = [UIImage imageNamed:@"icon_contact_normal"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //
    [tableView setDelegate:self];
    [tableView setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark   ---------tableView协议----------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CMainCell = @"CMainCell";     //  0
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CMainCell];      //   1
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier: CMainCell];    //  2
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    [label setBackgroundColor: [UIColor blueColor]];
    [label setText: [@"cell = " stringByAppendingFormat:@"%d", indexPath.item]];
    [cell.contentView addSubview:label];    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
