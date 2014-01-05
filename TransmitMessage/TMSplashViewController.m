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
#import "TMNetConnection.h"
#import "TMAccountVerifyRequest.h"
#import "TMAccountVerifyResponse.h"
#import "TMConfig.h"
#import "TMIMClient.h"

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
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 初始化操作
        [NSThread sleepForTimeInterval:5];
        dispatch_async(dispatch_get_main_queue(), ^{
            // 请求服务器
            TMAccountVerifyRequest * req = [[TMAccountVerifyRequest alloc] init];
            [req setSIMSerialNumber:@"460011110000001"];
            [TMNetConnection requestCenterServer:req success:^(TMResponse *resp) {
                //        NSLog(@"%@", [((TMAccountVerifyResponse *)resp) description]);
                //        NSLog(@"%@", [((TMAccountVerifyResponse *)resp).introduce objectAtIndex:0]);
                TMAccountVerifyResponse *response = (TMAccountVerifyResponse *)resp;
                // 保存配置
                [TMConfig putString:IM_SERVER value:response.IMServer];
                [TMConfig putInt:IM_SERVER_PORT value:response.IMServerPort.intValue];
                
                TMIMClient * client = [TMIMClient sharedInstance];
                [client connect];
            } faid:^(NSString *error) {
                
            }];
            // 进入主界面
            [(TMAppDelegate *)[UIApplication sharedApplication].delegate showMainView];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
