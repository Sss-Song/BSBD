//
//  zhuanTiXiangViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/5.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "zhuanTiXiangViewController.h"
#import "UMSocial.h"

@interface zhuanTiXiangViewController ()<UMSocialUIDelegate>

@end

@implementation zhuanTiXiangViewController


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
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.topic]];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    self.navigationController.navigationBar.tintColor =[UIColor blackColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setBackgroundImage:[UIImage imageNamed:@"topmenu_share.png"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(itemClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = item;
    
}

-(void)itemClicked{

    [UMSocialSnsService presentSnsIconSheetView:self
    appKey:@"568f91ffe0f55a8f9b00169f"shareText:self.topic shareImage:[UIImage imageNamed:@"city.png"]shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,UMShareToRenren,UMShareToTencent,nil]delegate:self];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
