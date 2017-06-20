//
//  AppDelegate.m
//  良仓
//
//  Created by 宋成博 on 15/12/30.
//  Copyright © 2015年 宋成博. All rights reserved.
//

#import "AppDelegate.h"
#import "GuangsViewController.h"
#import "findViewController.h"
#import "personViewController.h"
#import "MyViewController.h"


#import "firstViewController.h"
#import "classViewController.h"
#import "giftViewController.h"

#import "gongViewController.h"
#import "PlayerViewController.h"
#import "shiYeViewController.h"

#import "LeftSortsViewController.h"


#import "UMSocial.h"

#import "UMSocialQQHandler.h"

#import "UMSocialWechatHandler.h"

#import <MAMapKit/MAMapKit.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSUserDefaults standardUserDefaults]setObject:@NO forKey:@"isLogin"] ;
    
    [MAMapServices sharedServices].apiKey = @"65d4c16c96f07260b7e3b9104633904e";
    
     [UMSocialData setAppKey:@"568f91ffe0f55a8f9b00169f"];
    
    [UMSocialWechatHandler setWXAppId:@"wx533f39b3086cc95a" appSecret:@"7bfd11476e5c56bdbe19250379fec776" url:nil];
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    _window.backgroundColor = [UIColor whiteColor];
    
    [_window makeKeyAndVisible];
    
    
    //发现
//    firstViewController *f = [[firstViewController alloc]init];
//    f.view.backgroundColor = [UIColor whiteColor];
//    classViewController *c = [[classViewController alloc]init];
//    c.view.backgroundColor = [UIColor blackColor];
//    giftViewController *g = [[giftViewController alloc]init];
//    g.view.backgroundColor = [UIColor cyanColor];
    
    GuangsViewController *gvc = [[GuangsViewController alloc]init];
    
    //gvc.viewControllers = @[f,c,g];
    
    gvc.title = @"逛";
    
    gvc.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"逛" image:[UIImage imageNamed:@"eshops_2.png"] tag:0];
    
    UINavigationController *gnav = [[UINavigationController alloc]initWithRootViewController:gvc];
    
    
    //发现
    gongViewController *a = [[gongViewController alloc]init];
    shiYeViewController*b = [[shiYeViewController alloc]init];
    PlayerViewController *play = [[PlayerViewController alloc]init];
    findViewController *dvc = [[findViewController alloc]init];
    
    dvc.viewControllers = @[a,b,play];
    
    dvc.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"find_2.png"] tag:1];
    
    dvc.title = @"发现";
    
    UINavigationController *dnav = [[UINavigationController alloc]initWithRootViewController:dvc];
    
   
    
    
  //达人
    personViewController *pvc = [[personViewController alloc]init];
    
    pvc.title  = @"达人";
    
    UINavigationController *pnav = [[UINavigationController alloc]initWithRootViewController:pvc];
    
    LeftSortsViewController *leftVC = [[LeftSortsViewController alloc]init];
    
    self.LeftSlideVC = [[LeftSlideViewController alloc]initWithLeftView:leftVC andMainView:pnav];
    
    leftVC.myblock = ^(NSString *text){
      
         pvc.classID = text;
        
        [pvc.dataArray removeAllObjects];
        
        [pvc createDataSource];
        
    };
    
    self.LeftSlideVC.title = @"达人";
    
    self.LeftSlideVC.tabBarItem =[[UITabBarItem alloc]initWithTitle:@"达人" image:[UIImage imageNamed:@"choice_2.png"] selectedImage:[UIImage imageNamed:@"choice_2.png"]];
    
    
    MyViewController *myVC = [[MyViewController alloc]init];
    
    UINavigationController *myNav = [[UINavigationController alloc]initWithRootViewController:myVC];
    
    myVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"me_2.png"] tag:3];

    myVC.title = @"我的";
    
    
     UITabBarController *tab = [[UITabBarController alloc]init];
    
    tab.tabBar.tintColor = [UIColor blackColor];
    
    tab.viewControllers = @[gnav,dnav,self.LeftSlideVC,myNav];
    
    self.window.rootViewController = tab;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    }

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}

@end
