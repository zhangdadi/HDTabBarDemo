//
//  AppDelegate.m
//  HDTabBarDemo
//
//  Created by 张达棣 on 15/1/9.
//  Copyright (c) 2015年 adh. All rights reserved.
//

#import "AppDelegate.h"
#import "HDTabbarController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIViewController *a = [[UIViewController alloc] init];
    a.view.backgroundColor = [UIColor greenColor];
    a.hdTabBarItem = [HDTabBarItem itemWithTitle:@"首页" imageName:@"consult_item1" selectedImageName:@"consult_item1Select"];
    
    UIViewController *b = [[UIViewController alloc] init];
    b.view.backgroundColor = [UIColor redColor];
    b.hdTabBarItem = [HDTabBarItem itemWithTitle:@"商家" imageName:@"consult_item2" selectedImageName:@"consult_item2Select"];
    
    UIViewController *c = [[UIViewController alloc] init];
    c.hdTabBarItem = [HDTabBarItem itemWithTitle:@"活动" imageName:@"consult_item3" selectedImageName:@"consult_item3Select"];

    UIViewController *d = [[ViewController alloc] init];
    d.hdTabBarItem = [HDTabBarItem itemWithTitle:@"购物车" imageName:@"consult_item4" selectedImageName:@"consult_item4Select"];

    UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    UIViewController *eVc = [board instantiateViewControllerWithIdentifier: @"main"];
    UINavigationController *e = [[UINavigationController alloc] initWithRootViewController:eVc];
    e.hdTabBarItem = [HDTabBarItem itemWithTitle:@"我的" imageName:@"consult_item5" selectedImageName:@"consult_item5Select"];
    
    HDTabbarController *tab = [[HDTabbarController alloc] init];
    tab.viewControllers = @[a, b, c, d, e];
    tab.selectTextColor = [UIColor redColor];
    a.hdTabBarItem.number = 5;


    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tab;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
