//
//  TMSplashViewController.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-12.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMSplashViewController.h"
#import "SysConfig.h"
#import "TMAppDelegate.h"

@interface TMSplashViewController ()

@end

@implementation TMSplashViewController

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
    NSString *background;
    if (IS_IPHONE_5) {
        background = [[NSBundle mainBundle] pathForResource:@"Default-568h@2x" ofType:@"png"];
    }
    else{
        background = [[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"];
    }
    
    
    UIImage *backImage = [UIImage imageWithContentsOfFile:background];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:backImage];
    [self.view addSubview:bgImageView];
    [self.view sendSubviewToBack:bgImageView];
    
    // 初始化操作
    
    // 进入主界面
    [(TMAppDelegate *)[UIApplication sharedApplication].delegate showMainView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
