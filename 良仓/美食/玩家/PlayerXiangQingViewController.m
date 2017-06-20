//
//  PlayerXiangQingViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/11.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "PlayerXiangQingViewController.h"

#import "UMSocial.h"

@interface PlayerXiangQingViewController ()<UMSocialUIDelegate>
{

    CGSize  _fittingSize;

}
@end

@implementation PlayerXiangQingViewController

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

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.shareUrl]];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setBackgroundImage:[UIImage imageNamed:@"topmenu_share.png"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(itemClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = item;
    
    
}

-(void)itemClicked{

 [UMSocialSnsService presentSnsIconSheetView:self appKey:@"568f91ffe0f55a8f9b00169f"shareText:self.shareUrl shareImage:[UIImage imageNamed:@"city.png"]shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,UMShareToRenren,UMShareToTencent,UMShareToWechatTimeline,nil]delegate:self];


}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}



@end
