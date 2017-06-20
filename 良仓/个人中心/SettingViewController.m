//
//  SettingViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/11.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "SettingViewController.h"
#import "zhuCeViewController.h"
#import "dengLuViewController.h"
#import "UMSocial.h"
#import "MySubView.h"
#import "UIImageView+WebCache.h"

@interface SettingViewController ()<UMSocialUIDelegate>

@end

@implementation SettingViewController


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = YES;
    
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = NO;
    
    self.navigationController.navigationBar.hidden = NO;
}




- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"loginBG2.jpg"];
    
    [self.view addSubview:imageView];
    
    [self createUI];
    
    [self createSheJiaoButtons];
    
}

-(void)createUI{

    
    UIButton *backButton = [[UIButton alloc]init];
    backButton.frame = CGRectMake(self.view.frame.size.width-60, 30, 30, 30);
    [backButton setBackgroundImage:[UIImage imageNamed:@"btn_nav_close4.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    
    UIButton *zhuCeButton = [[UIButton alloc]initWithFrame:CGRectMake(30, self.view.frame.size.height-200, self.view.frame.size.width-60, 40)];
    zhuCeButton.backgroundColor =[UIColor whiteColor];
    [zhuCeButton setTitle:@"注册账号" forState:UIControlStateNormal];
    [zhuCeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [zhuCeButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    zhuCeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [zhuCeButton addTarget:self action:@selector(zhuCeClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zhuCeButton];
    
    
    UIButton *dengluButton = [[UIButton alloc]initWithFrame:CGRectMake(30, self.view.frame.size.height-150, self.view.frame.size.width-60, 40)];
    dengluButton.backgroundColor =[UIColor blackColor];
    [dengluButton setTitle:@"已有账号登录" forState:UIControlStateNormal];
    [dengluButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [dengluButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [dengluButton addTarget:self action:@selector(dengluButton) forControlEvents:UIControlEventTouchUpInside];
    
    dengluButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:dengluButton];
    
    
    
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-90, self.view.frame.size.width, 20)];
    lable.text = @"社交账号登录:";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:13];
    lable.textColor = [UIColor whiteColor];
    [self.view addSubview:lable];

}

-(void)createSheJiaoButtons{
    
    NSArray *array = @[@"loginTencentQQ.png",@"loginSinaWeibo.png",@"loginWeixin.png",@"loginTencentWeibo.png",@"loginDouban.png"];
    
    for (int i = 0; i<array.count; i++) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(48+i*(self.view.frame.size.width-185)/5+i*20, self.view.frame.size.height-50,(self.view.frame.size.width-185)/5, 30)];
        [button setBackgroundImage:[UIImage imageNamed:array[i]]forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = 100+i;
        
        [self.view addSubview:button];
        
    }

}

-(void)backClicked{

    [self.navigationController popViewControllerAnimated:YES];

}

-(void)zhuCeClicked{

    zhuCeViewController *vc = [[zhuCeViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)dengluButton{

    dengLuViewController *vc = [[dengLuViewController alloc]init];

    [self.navigationController pushViewController:vc animated:YES];
    
}



-(void)buttonClicked:(UIButton *)button{
    
    if (button.tag==100) {
        
        
        
    }
    if (button.tag==101) {
        
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
        
        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
            
            //          获取微博用户名、uid、token等
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
                
                NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
                
                self.returnBlock(snsAccount.iconURL,snsAccount.userName);
                
                [[NSUserDefaults standardUserDefaults]setObject:@YES forKey:@"isLogin"];
                
                [self.navigationController popViewControllerAnimated:YES];
         }});
        
    }
    if (button.tag==102) {
        
        
        
    }
    if (button.tag==103) {
        
        
        
    }
    if (button.tag==104) {
        
        
        
    }
    
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
   
}

@end
