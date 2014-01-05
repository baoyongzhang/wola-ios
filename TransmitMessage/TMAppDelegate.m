//
//  TMAppDelegate.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-12.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMAppDelegate.h"
#import "TMSplashViewController.h"
#import "TMGuideViewController.h"
#import "TMMainViewController.h"
#import "TMIMClient.h"
#import "TMConfig.h"

@implementation TMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    // 创建配置文件
    if(![TMConfig isExistConfigFile]){
        [TMConfig createConfigFile];
    }
    
    // 判断如果是第一次，启动Guide界面
    if([TMConfig getBool:IS_SHOW_BROWSER]){
        TMSplashViewController *mainViewController = [[TMSplashViewController alloc] init];
        self.window.rootViewController = mainViewController;
    }else{
        TMGuideViewController *guideViewController = [[TMGuideViewController alloc] init];
        self.window.rootViewController = guideViewController;    // 否则进入主页面
    }
    // 启动页面等待两秒
//    [NSThread sleepForTimeInterval:2];
    
    return YES;
}

- (void) showMainView
{
    TMMainViewController *mainViewController = [[TMMainViewController alloc] init];
    self.window.rootViewController = mainViewController;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//    [application beginBackgroundTaskWithExpirationHandler:^{
//        while(YES){
//            NSLog(@".............background run");
//            [NSThread sleepForTimeInterval:1];
//        }
//    }];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
//    [[TMIMClient sharedInstance] send];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
