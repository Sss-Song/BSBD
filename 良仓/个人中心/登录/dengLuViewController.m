//
//  dengLuViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/12.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "dengLuViewController.h"
#import "MyViewController.h"
#import "userInfo.h"
@interface dengLuViewController ()

@end

@implementation dengLuViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.navigationController.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.tabBarController.tabBar.hidden = NO;

}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image =[UIImage imageNamed:@"brand_bg.png"];
    
    [self.view addSubview:imageView];
    
    
    
    [self createUI];
    
    [self createTextField];
   
}

-(void)createUI{

    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 30, 100, 20)];
    lable.text = @"登录良仓";
    lable.backgroundColor = [UIColor clearColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor whiteColor];
    
    lable.font = [UIFont systemFontOfSize:18];
    
    [self.view addSubview:lable];
    
    
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 30, 20, 20)];
    [button setBackgroundImage:[UIImage imageNamed:@"loginBack.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
}

-(void)createTextField{

    UIImageView *nameView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 100, self.view.frame.size.width-80, 40)];
    nameView.image =[UIImage imageNamed:@"loginUsername.png"];

    nameView.userInteractionEnabled = YES;
    [self.view addSubview:nameView];
    
    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(48 , 5, self.view.frame.size.width-128, 30)];
    nameField.backgroundColor = [UIColor clearColor];
    
    nameField.placeholder = @"     手机号/用户名/邮箱";
    
    nameField.tag = 10;
    
    nameField.textColor = [UIColor whiteColor];
    
    [nameView addSubview:nameField];
    
    
    UIImageView *passWordView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 160, self.view.frame.size.width-80, 40)];
    passWordView.image =[UIImage imageNamed:@"loginPassWord.png"];
    
    passWordView.userInteractionEnabled = YES;
    
    [self.view addSubview:passWordView];
    
    UITextField *passWordField = [[UITextField alloc]initWithFrame:CGRectMake(48, 5, self.view.frame.size.width-128, 30)];
    passWordField.backgroundColor = [UIColor clearColor];
    passWordField.placeholder = @"     请输入密码";
    passWordField.textColor = [UIColor whiteColor];
    passWordField.tag = 20;
    [passWordView addSubview:passWordField];
    
    
    
    UIButton *dendluButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 240, self.view.frame.size.width-100, 40)];
    
    [dendluButton setBackgroundImage:[UIImage imageNamed:@"bg_nav_bar.png"] forState:UIControlStateNormal];
    [dendluButton setTitle:@"登录" forState:UIControlStateNormal];
    
    [dendluButton addTarget:self action:@selector(dengluClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dendluButton];
    
}


-(void)button{

    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)dengluClicked{
    
    
    
    UITextField *textField1 = (id)[self.view viewWithTag:10];
    UITextField *textField2 = (id)[self.view viewWithTag:20];
    
    //取出所有已存在的用户
    NSString *path = [NSString stringWithFormat:@"%@/Documents/UserInfo.plist",NSHomeDirectory()];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    BOOL isHaven = NO;//标记用户是否存在
    BOOL isError = NO;// 标记密码是否错误
    for(NSData *data in array)
    {
        userInfo *user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if ([user.userName isEqualToString:textField1.text]) {
            isHaven = YES;
            if (![user.password isEqualToString:textField2.text]) {
                
                isError = YES;
            }
            //结束循环
            break;
        }
    }
    if(isHaven && isError == NO)
    {
     
        
        [[NSUserDefaults standardUserDefaults]setObject:@YES forKey:@"isLogin"];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }else if(isHaven == NO)
    {
        
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"用户名不存在" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        alertView.alertViewStyle = UIAlertViewStyleDefault;
        
        [alertView show];
        
        
        NSLog(@"用户不存在");
    }else
    {
        
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码错误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        alertView.alertViewStyle = UIAlertViewStyleDefault;
        
        [alertView show];
        
        
        NSLog(@"密码错误");
    }
    

    NSUserDefaults *defauts = [NSUserDefaults standardUserDefaults];
    
    [defauts setObject:textField1.text forKey:@"showText"];
    
    [defauts synchronize];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
