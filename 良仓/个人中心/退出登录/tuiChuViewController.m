//
//  tuiChuViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/16.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "tuiChuViewController.h"
#import "tuiChuTableViewCell.h"

@interface tuiChuViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_tableView;
    

}
@end

@implementation tuiChuViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createtableView];
    
    self.title = @"设置";
   
}

-(void)createtableView{

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _tableView.backgroundColor =[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    
    [self.view addSubview:_tableView];
    
}

#pragma mark -- tableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    if (section==0) {
        
        return 3;
        
    }else{
    
        return  1;
        
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 40;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSInteger a = indexPath.section;
    
    NSInteger b = indexPath.row;
    

    tuiChuTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[tuiChuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
        
    }
    
    if (a==0&&b==0) {
        
        cell.textLable.text = @"清除缓存";
        
    }
    if (a==0&&b==1) {
        
        cell.textLable.text = @"检查最新版本";
        
        cell.subLable.text = @"当前版本:2.3";
        
        cell.subLable.textAlignment = NSTextAlignmentRight;
    }
    if (a==0&&b==2) {
        
        cell.textLable.text = @"关于我们";
    }
    
    if (a==1&&b==0) {
        
        cell.tuichuLable.text = @"退出登录";
        
        cell.tuichuLable.textAlignment = NSTextAlignmentCenter;
    }
    

    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.1;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSInteger a = indexPath.section;
    
    NSInteger b = indexPath.row;
    
    if (a==0&&b==0) {
        
        
    }
    if (a==0&&b==1) {
        
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已是最新版本" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        alertView.alertViewStyle = UIAlertViewStyleDefault;
        
        //显示当窗口上
        [alertView show];
       
    }
    if (a==0&&b==2) {
        
        
    }
    
    if (a==1&&b==0) {
        
        
        [self.navigationController popViewControllerAnimated:YES];
        
        [[NSUserDefaults standardUserDefaults]setObject:@NO forKey:@"isLogin"];
        
    }
    
}





- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
  
}



@end
