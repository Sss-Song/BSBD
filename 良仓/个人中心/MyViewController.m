//
//  MyViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/7.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "MyViewController.h"
#import "MySubView.h"
#import "SettingViewController.h"
#import "UIImageView+WebCache.h"

#import "Masonry.h"
#import "QRCodeGenerator.h"
#import "Scan_VC.h"
#import "feedbackViewController.h"
#import "MyAddressViewController.h"
#import "erWeiMaViewController.h"
#import "tuiChuViewController.h"
#import "newsViewController.h"



@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *_tableView;
    
    MySubView *_subView;
   
}
@end

@implementation MyViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = NO;
    
    self.navigationController.navigationBar.hidden = NO;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = NO;
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createTableView];
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 23, 23)];
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"shezhi2.png"] forState:UIControlStateNormal];
    
    //  sldebar_personal_settings.png
    
    [rightButton addTarget:self action:@selector(rightClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;

}

-(void)rightClicked{

    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"isLogin"]boolValue]) {
        
        //[[NSUserDefaults standardUserDefaults]setObject:@NO forKey:@"isLogin"];
        
        tuiChuViewController *vc = [[tuiChuViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else{
    
        
        SettingViewController *vc = [[SettingViewController alloc]init];
        
        vc.returnBlock = ^(NSString *iconUrl,NSString *userName){
            
            [_subView.photoView sd_setImageWithURL:[NSURL URLWithString:iconUrl]];
            
            _subView.nameLable.text = userName;
        };
        
        [self.navigationController pushViewController:vc animated:YES];

    }
    
    
}

-(void)createTableView{

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.backgroundColor =[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];


    [self.view addSubview:_tableView];
    
    _subView = [[MySubView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    _subView.backgroundColor =[UIColor whiteColor];
    
    _subView.MyView = self;
    
    _tableView.tableHeaderView = _subView;
    

}

#pragma mark - tableView


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.5;

}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section==0) {
        return 2;
        
    }
    else if (section==1) {
        
        return 3;
    }
    else {
        
        return 2;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 40;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
        
        
    }
    
    NSInteger a = indexPath.section;
    
    NSInteger b = indexPath.row;
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    if (a==0&&b==0) {
        
        cell.textLabel.text = @"我的收藏";

    }
    
    if (a==0&&b==1) {
        
        cell.textLabel.text = @"我的分享";
    }
    if (a==1&&b==0) {
        
        cell.textLabel.text = @"扫一扫";
    }
    if (a==1&&b==1) {
        
        cell.textLabel.text = @"良仓二维码";
    }
    
    if (a==1&&b==2) {
        
        cell.textLabel.text = @"我的收货地址";
        
    }
    if (a==2&&b==0) {
        
        cell.textLabel.text = @"用户反馈";
        
    }
    if (a==2&&b==1) {
        
        cell.textLabel.text = @"良仓客服";
        
    }
    
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
     // cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    NSInteger a = indexPath.section;
    
    NSInteger b = indexPath.row;
    
    //我的收藏
    if (a==0&&b==0) {
        
         [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }
    
    //我的分享
    if (a==0&&b==1) {
         [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }
    
    //扫一扫
    if (a==1&&b==0) {

       
            
            
            Scan_VC *vc = [[Scan_VC alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
            
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        
    }
    
    //二维码
    if (a==1&&b==1) {
        
       
            erWeiMaViewController *vc = [[erWeiMaViewController alloc]init];
            
            vc.title = @"良仓二维码";
            
            [self.navigationController pushViewController:vc animated:NO];
            
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }
    
    //我的收货地址
    if (a==1&&b==2) {
        
        
            MyAddressViewController *vc =[[MyAddressViewController alloc]init];
            
            vc.title = @"收货地址";
            
            [self.navigationController pushViewController:vc animated:YES];
        
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        
    }
    
    if (a==2&&b==0) {
        
        feedbackViewController *vc =[[feedbackViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:NO];
        
         [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }
    if (a==2&&b==1) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        newsViewController *vc = [[newsViewController alloc]init];
        
        vc.title = @"良仓客服";
        
        [self.navigationController pushViewController:vc animated:NO];
        
        
        
        
    }
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
