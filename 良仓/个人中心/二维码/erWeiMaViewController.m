//
//  erWeiMaViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/15.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "erWeiMaViewController.h"
#import "QRCodeGenerator.h"

@interface erWeiMaViewController ()

@end

@implementation erWeiMaViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = YES;


}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = YES;


}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 400)];
    
    imageView.backgroundColor =[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    
    imageView.image = [QRCodeGenerator qrImageForString:@"www.baidu.com" imageSize:300 Topimg:[UIImage imageNamed:@"daren.png"]];
    
    [self.view addSubview:imageView];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 500, self.view.frame.size.width-40, 40)];
    lable.backgroundColor =[UIColor blackColor];
    
    [self.view addSubview:lable];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
