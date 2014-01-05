//
//  TMChatViewController.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-25.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMChatViewController.h"
#import "TMConversation.h"
#import "TMMessageEngine.h"
#import "TMChatCell.h"
#import "TMMessage.h"

@interface TMChatViewController ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation TMChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = self.conversation.targetName;
    self.list = [TMMessageEngine queryMessagesByTarget:self.conversation.target];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height=70.f;
    TMMessage *msg = [self.list objectAtIndex:indexPath.row];
    CGSize size = [msg.content sizeWithFont:[UIFont fontWithName:@"Helvetica" size:14] constrainedToSize:CGSizeMake(210, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    height=size.height+55.f;
    return height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TMChatCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TMChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setMessage:[self.list objectAtIndex:indexPath.item]];
    // Configure the cell...
    
    return cell;
}


@end
