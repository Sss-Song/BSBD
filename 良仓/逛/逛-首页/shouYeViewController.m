//
//  shouYeViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/11.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "shouYeViewController.h"

@interface shouYeViewController ()

@end

@implementation shouYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.openUrl]];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
