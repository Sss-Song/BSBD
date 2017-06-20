//
//  zhuCeViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/12.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "zhuCeViewController.h"
#import "userInfo.h"
@interface zhuCeViewController ()

@end

@implementation zhuCeViewController


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
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    imageView.image =[UIImage imageNamed:@"brand_bg.png"];
    
    [self.view addSubview:imageView];
    
    [self createUI];
    
    [self createButtons];
    
}

-(void)createUI{


    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 30, 100, 20)];
    lable.text = @"注册账号";
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

-(void)createButtons{


    UIImageView *nameView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 100, self.view.frame.size.width-80, 40)];
    nameView.image =[UIImage imageNamed:@"loginUsername.png"];
    
    nameView.userInteractionEnabled = YES;
    
    [self.view addSubview:nameView];
    
    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(48 , 5, self.view.frame.size.width-128, 30)];
    nameField.backgroundColor = [UIColor clearColor];
    
    nameField.placeholder = @"     请设置用户名";
    
    nameField.textColor = [UIColor whiteColor];
    
    nameField.tag = 10;
    
    [nameView addSubview:nameField];
    
    
    UIImageView *passWordView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 160, self.view.frame.size.width-80, 40)];
    passWordView.image =[UIImage imageNamed:@"loginPassword.png"];
    
    passWordView.userInteractionEnabled = YES;
    
    [self.view addSubview:passWordView];
    
    UITextField *passWordField = [[UITextField alloc]initWithFrame:CGRectMake(48, 5, self.view.frame.size.width-128, 30)];
    passWordField.backgroundColor = [UIColor clearColor];
    
    passWordField.textColor = [UIColor whiteColor];
    
    passWordField.placeholder = @"     请设置密码";
    
    passWordField.tag = 20;
    
    [passWordView addSubview:passWordField];
    
    
    

    UIButton *dendluButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 240, self.view.frame.size.width-100, 40)];
    
    [dendluButton setBackgroundImage:[UIImage imageNamed:@"bg_nav_bar.png"] forState:UIControlStateNormal];
    [dendluButton setTitle:@"注册" forState:UIControlStateNormal];
    
    [dendluButton addTarget:self action:@selector(zhuCeClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dendluButton];
    
}

-(void)button{
    
    
  [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

-(void)zhuCeClicked{

    UITextField *textField1 = (id)[self.view viewWithTag:10];
    UITextField *textField2 = (id)[self.view viewWithTag:20];
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents/UserInfo.plist",NSHomeDirectory()];
    userInfo *newUser = [[userInfo alloc]init];
    newUser.userName = textField1.text;
    newUser.password = textField2.text;
    NSMutableArray *newArray = [[NSMutableArray alloc]init];
    //取出已有用户
    NSArray *oldUsers = [NSArray arrayWithContentsOfFile:path];
    BOOL isHaven = NO;//标记当前用户是否已经被注册
    for ( NSData *data in oldUsers) {
        //反归档
        userInfo *oldUser = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        //判断用户是否存在
        if([newUser.userName isEqualToString:oldUser.userName]){
            isHaven = YES;
    
            UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"用户名已经存在" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
             alertView.alertViewStyle = UIAlertViewStyleDefault;
            
            [alertView show];
            
             break;
        }
        
    }
    if(isHaven == NO)
    {
        //先把旧的用户添加进去,否则永远只存下一个用户
        [newArray addObjectsFromArray:oldUsers];
        //归档成为NSData
        NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:newUser];
        [newArray addObject:userData];
        //写入文件
        [newArray writeToFile:path atomically:YES];
      
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"注册成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        alertView.alertViewStyle = UIAlertViewStyleDefault;
        
        [alertView show];
        
        [self.navigationController popViewControllerAnimated:YES];
    
    }

    
    
    
    
  
    
    
    

}




- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
