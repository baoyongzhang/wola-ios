//
//  TMMainViewController.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-12.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMMainViewController.h"
#import "TMCallViewController.h"
#import "TMMessageViewController.h"
#import "TMContactViewController.h"
#import "TMMoreViewController.h"
#import "TMBaseViewController.h"

@interface TMMainViewController ()

@end

@implementation TMMainViewController

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
    // 初始化TabBar
    TMMessageViewController *messageVC = [[TMMessageViewController alloc] init];
    TMBaseViewController *messageNav = [[TMBaseViewController alloc] initWithRootViewController:messageVC];
    [messageVC release];
    
    TMCallViewController *callVC = [[TMCallViewController alloc] init];
    TMBaseViewController *callNav = [[TMBaseViewController alloc] initWithRootViewController:callVC];
    [callVC release];
    
    TMContactViewController *contactVC = [[TMContactViewController alloc] init];
    TMBaseViewController *contactNav = [[TMBaseViewController alloc] initWithRootViewController:contactVC];
    [contactVC release];
    
    TMMoreViewController *moreVC = [[TMMoreViewController alloc] init];
    TMBaseViewController *moreNav = [[TMBaseViewController alloc] initWithRootViewController:moreVC];
    [moreVC release];
    
    [self setViewControllers:[NSArray arrayWithObjects:messageNav, callNav, contactNav, moreNav, nil]];
    
    [messageNav release];
    [callNav release];
    [contactNav release];
    [moreNav release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
