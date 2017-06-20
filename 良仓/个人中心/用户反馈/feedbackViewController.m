//
//  feedbackViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/14.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "feedbackViewController.h"

@interface feedbackViewController ()
{

    UILabel *_lable;
    
    UITextView *_textView;

}
@end

@implementation feedbackViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear: animated];
    
    self.navigationController.tabBarController.tabBar.hidden =YES;

}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = NO;


}


- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    self.title = @"用户反馈";
    
    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    
    [button setTitle:@"发送" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = item;
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    [self createUI];
    
}

-(void)createUI{

    
    UILabel *JYlable =[[UILabel alloc]initWithFrame:CGRectMake(10, 74, 200, 20)];
    JYlable.text = @"意见反馈";
    
    JYlable.font =[UIFont systemFontOfSize:17];
    
    JYlable.textColor = [UIColor blackColor];
    
    [self.view addSubview:JYlable];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, 200)];
    
    _textView.scrollEnabled = YES;
    

    

    _textView.backgroundColor =[UIColor whiteColor];
    
    _textView.font = [UIFont systemFontOfSize:17];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _textView.layer.borderColor = UIColor.blackColor.CGColor;
    
    _textView.layer.borderWidth = 0.5;
    
    _textView.backgroundColor =[UIColor whiteColor];
    
    [self.view addSubview:_textView];
    

    
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 350, self.view.frame.size.width, 30)];
    
    textField.placeholder = @"                           邮箱/qq/手机皆可";
    
    
    textField.layer.borderColor = UIColor.blackColor.CGColor;
    
    textField.layer.borderWidth = 0.5;
    
    textField.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:textField];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 320, 200, 20)];
    lable.text = @"联系方式";
    lable.textColor =[UIColor blackColor];
    lable.font =[UIFont systemFontOfSize:17];
    [self.view addSubview:lable];
    
}

-(void)buttonClicked{

    if ([_textView.text length]!=0) {
        
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"发送反馈成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        alertView.alertViewStyle = UIAlertViewStyleDefault;
        
        //显示当窗口上
        [alertView show];
        
      [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    else{
    
    
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"意见反馈不能为空" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        alertView.alertViewStyle = UIAlertViewStyleDefault;
        
        //显示当窗口上
        [alertView show];
    }
    
}


//点击空白收起键盘
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
