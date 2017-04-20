//
//  AppDelegate.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/26.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "AppDelegate.h"
#import "ZZQLoginViewController.h"
#import "ZZQTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //注册LearnCloud
    [AVOSCloud setApplicationId:@"xqDPunJj8jQcQk8exktvw5UB-gzGzoHsz" clientKey:@"YqkYVhUj2pWRx4r7hQ3gmv1v"];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
//    [AVUser logOut];
    //就是之前登陆了
    if ([AVUser currentUser]){
        //利用learnCloud再登录
        ZZQTabBarViewController * tabBarVC = [[ZZQTabBarViewController alloc] init];
        self.window.rootViewController = tabBarVC;
    }else{
        ZZQLoginViewController * loginVC = [[ZZQLoginViewController alloc] init];
        self.window.rootViewController = loginVC;
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
