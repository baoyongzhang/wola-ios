//
//  TMBaseViewController.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-13.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMBaseViewController.h"

@interface TMBaseViewController ()

@end

@implementation TMBaseViewController

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
	// Do any additional setup after loading the view.
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        //        self.extendedLayoutIncludesOpaqueBars = NO;
        //        self.modalPresentationCapturesStatusBarAppearance = NO;
        //        self.navigationController.navigationBar.barTintColor =[UIColor grayColor];
        //        self.tabBarController.tabBar.barTintColor =[UIColor grayColor];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
