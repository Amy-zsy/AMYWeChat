//
//  AppDelegate.m
//  amywechat
//
//  Created by Amy on 2019/4/6.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AppDelegate.h"
#import "AMYMeViewController.h"
#import "AMYChatsViewController.h"
#import "AMYContactsViewController.h"
#import "AMYDiscoverViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UITabBarController *tab = [[UITabBarController alloc] init];
    UINavigationController *chats = [self setNavControllerWithClass:AMYChatsViewController.class title:@"WeChat" tab:@"Chats"];
    UINavigationController *contacts = [self setNavControllerWithClass:AMYContactsViewController.class title:@"Contacts" tab:@"Contacts"];
    UINavigationController *discover = [self setNavControllerWithClass:AMYDiscoverViewController.class title:@"Discover" tab:@"Discover"];
    UINavigationController *me = [self setNavControllerWithClass:AMYMeViewController.class title:@"" tab:@"Me"];
    tab.viewControllers = @[chats, contacts, discover, me];
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

- (UINavigationController *)setNavControllerWithClass:(Class)viewController title:(NSString *)title tab:(NSString *)tab{
    
    UIViewController *vc = [[viewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.shadowImage = [[UIImage alloc] init];
    nav.navigationBar.barTintColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1];
    nav.tabBarItem.title = tab;
    vc.navigationItem.title = title;
    return nav;
    
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
