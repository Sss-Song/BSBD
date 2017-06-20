//
//  addViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/15.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "addViewController.h"

@interface addViewController ()

@end

@implementation addViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = NO;


}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
   
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
   
}


@end
