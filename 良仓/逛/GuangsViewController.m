//
//  GuangsViewController.m
//  良仓
//
//  Created by 宋成博 on 15/12/31.
//  Copyright © 2015年 宋成博. All rights reserved.
//

#import "GuangsViewController.h"
#import "firstViewController.h"
#import "classViewController.h"
#import "giftViewController.h"
#import "zhuanTiViewController.h"
#import "shareViewController.h"
#import "myShareViewController.h"
#import "brandViewController.h"

@interface GuangsViewController ()

@end

@implementation GuangsViewController


-(instancetype)init{


    if (self = [super init]) {
        
        [self creatUI];
    }

    return self;
}

-(void)creatUI{

    self.menuViewStyle = WMMenuViewStyleLine;
    
    self.titleSizeNormal = 15;
    
    self.titleColorNormal =[UIColor grayColor];
    
    self.titleColorSelected = [UIColor blackColor];
    
    self.titles = @[@"首页",@"分类",@"品牌",@"礼物",@"专题",@"分享"];

    self.viewControllerClasses = @[[firstViewController class],[classViewController class],[brandViewController class],[giftViewController class],[zhuanTiViewController class],[shareViewController class]];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
