//
//  giftViewController.m
//  良仓
//
//  Created by 宋成博 on 15/12/30.
//  Copyright © 2015年 宋成博. All rights reserved.
//

#import "giftViewController.h"

#import "giftnextViewController.h"

@interface giftViewController ()

@end

@implementation giftViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createUI];
    
    [self createbuttons];
    
    self.view.backgroundColor = [UIColor whiteColor];
}


-(void)createUI{

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    
    [button setBackgroundImage:[UIImage imageNamed:@"banner01@2x.png"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:button];
    
}

-(void)buttonClicked{


    giftnextViewController *vc = [[giftnextViewController alloc]init];
    
    vc.list_ID = 7;
    
    vc.title = @"礼物精选";
    
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)createbuttons{

    CGFloat a = self.view.frame.size.width/3;
    
    CGFloat b = (self.view.frame.size.height-250-44-44-20-30)/2;
    
    NSArray *array = @[@"节日@2x.png",@"爱情@2x.png",@"生日@2x.png",@"朋友@2x.png",@"孩子@2x.png",@"父母@2x.png"];
    
    for (int i =0; i<array.count; i++) {
        
        UIButton *button = [[UIButton alloc]init];
        
        button.frame = CGRectMake((i%3)*a, 250+(i/3)*b , a, b);
        
        [button setBackgroundImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        
        
        [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = 100+i;
        
        [self.view addSubview:button];
        
        
        
    }
}

-(void)button:(UIButton *)button{

    
    if (button.tag==100) {
        
        giftnextViewController *vc = [[giftnextViewController alloc]init];
        vc.list_ID = 1;
        
        vc.title = @"节日";
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag==101) {
        
        giftnextViewController *vc = [[giftnextViewController alloc]init];
        vc.list_ID = 2;
        
        vc.title = @"爱情";
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag==102) {
        giftnextViewController *vc = [[giftnextViewController alloc]init];
        vc.list_ID = 3;
        
        vc.title = @"生日";
        
        [self.navigationController pushViewController:vc animated:YES];
    
    }
    if (button.tag==103) {
        giftnextViewController *vc = [[giftnextViewController alloc]init];
        vc.list_ID = 4;
        
        vc.title = @"朋友";
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag==104) {
        giftnextViewController *vc = [[giftnextViewController alloc]init];
        vc.list_ID = 5;
        
        vc.title = @"孩子";
        
        [self.navigationController pushViewController:vc animated:YES];    }
    if (button.tag==105) {
        giftnextViewController *vc = [[giftnextViewController alloc]init];
        vc.list_ID = 6;
        
        vc.title = @"父母";
        
        [self.navigationController pushViewController:vc animated:YES];    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
