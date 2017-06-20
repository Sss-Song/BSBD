//
//  newsViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/18.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "newsViewController.h"
#import "newsTableViewCell.h"

@interface newsViewController ()<UITableViewDataSource,UITableViewDelegate>
{

   
    UITableView *_tableView;

}
@end

@implementation newsViewController

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
    
    self.navigationController.navigationBar.tintColor =[UIColor blackColor];
    
    [self createTableView];
   
}

-(void)createTableView{

    _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    
    _tableView.delegate =self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 3;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 40;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSInteger a = indexPath.row;

    newsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[newsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }
    
    
    if (a==0) {
        
        cell.firstLable.text = @"客服热线";
        
        cell.nextLable.text = @"400-1234567";
        
    }
    if (a==1) {
        
        cell.firstLable.text = @"在线客服";
        
        cell.nextLable.text = @">";
        
    }
    if (a==2) {
        
        cell.firstLable.text = @"售后服务";
        
        cell.nextLable.text = @">";
    }
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{



    [tableView deselectRowAtIndexPath:indexPath animated:YES];



}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



@end
