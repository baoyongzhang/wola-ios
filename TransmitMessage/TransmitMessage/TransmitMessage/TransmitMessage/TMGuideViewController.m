//
//  GuideViewController.m
//  WhoyaoIOSProject
//
//  Created by Myliang on 13-3-2.
//  Copyright (c) 2013年 Reuniontech. All rights reserved.
//

#import "TMGuideViewController.h"
#import "SysConfig.h"
#import "TMSplashViewController.h"

@interface TMGuideViewController ()

@end

@implementation TMGuideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    NSLog(@"%f",self.view.bounds.size.height);
    Scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    Scrollview.backgroundColor = [UIColor blueColor];
    Scrollview.showsVerticalScrollIndicator = NO;
    Scrollview.showsHorizontalScrollIndicator = NO;
    Scrollview.delegate = self;
    Scrollview.userInteractionEnabled = YES;
    Scrollview.pagingEnabled = YES;
    Scrollview.bounces =  NO ;
    Scrollview.directionalLockEnabled = YES;
    Scrollview.delaysContentTouches = YES;
    Scrollview.contentSize = CGSizeMake(1280, self.view.bounds.size.height);
    [self.view addSubview:Scrollview];
    UIImageView *FirstImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    NSString *imageOne;
    NSString *imageTwo;
    NSString *imageThree;
    NSString *imageFour;
    if (iPhone5) {
        imageOne  =  [[NSBundle mainBundle] pathForResource:@"help1-568h@2x" ofType:@"png"];
        imageTwo =  [[NSBundle mainBundle] pathForResource:@"help2-568h@2x" ofType:@"png"];
        imageThree =  [[NSBundle mainBundle] pathForResource:@"help3-568h@2x" ofType:@"png"];
        imageFour  =  [[NSBundle mainBundle] pathForResource:@"help4-568h@2x" ofType:@"png"];
    }
    else
    {
        imageOne  =  [[NSBundle mainBundle] pathForResource:@"help1" ofType:@"png"];
        imageTwo =  [[NSBundle mainBundle] pathForResource:@"help2" ofType:@"png"];
        imageThree =  [[NSBundle mainBundle] pathForResource:@"help3" ofType:@"png"];
        imageFour  =  [[NSBundle mainBundle] pathForResource:@"help4" ofType:@"png"];
    }
    
    FirstImage.image = [UIImage imageWithContentsOfFile:imageOne];
    [Scrollview addSubview:FirstImage];
    UIImageView *SecondImage = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0,self.view.bounds.size.width, self.view.bounds.size.height)];
    SecondImage.image = [UIImage imageWithContentsOfFile:imageTwo];
    [Scrollview addSubview:SecondImage];
    UIImageView *ThirdImage = [[UIImageView alloc] initWithFrame:CGRectMake(640, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    ThirdImage.image = [UIImage imageWithContentsOfFile:imageThree];
    [Scrollview addSubview:ThirdImage];
    UIImageView *fourthImage = [[UIImageView alloc] initWithFrame:CGRectMake(960, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    
    
    fourthImage.image = [UIImage imageWithContentsOfFile:imageFour];
    [Scrollview addSubview:fourthImage];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(960, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(jumpToLoginView) forControlEvents:UIControlEventTouchUpInside];
    [Scrollview addSubview:button];
}

- (void)jumpToLoginView
{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"进入主页面" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
//    [alert setTag:10086];
//    [alert addButtonWithTitle:@"确定"];
//    [alert show];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
     TMSplashViewController *splashView = [[TMSplashViewController alloc] init];
    [self presentModalViewController:splashView animated:YES];
    [splashView release];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
//    int offx = fabs(scrollView.contentOffset.x);
//    int width = self.view.frame.size.width *3;
//    
//    if (offx>=width)
//    {
//        LoginViewController *loginView = [[LoginViewController alloc] init];
//        self.modalTransitionStyle = UIModalTransitionStylePartialCurl;
//        [self presentModalViewController:loginView animated:YES];
//    }
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
