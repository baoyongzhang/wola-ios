//
//  TMCallViewController.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-13.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMCallViewController.h"

@interface TMCallViewController ()

@end

@implementation TMCallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"通话";
        self.tabBarItem.image = [UIImage imageNamed:@"icon_call_normal"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
