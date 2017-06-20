//
//  followViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/14.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "followViewController.h"
#import "followTableViewCell.h"
#import "followADView.h"
#import "AFNetworking.h"
#import "followModel.h"
#import "Header1.h"
#import "DaRenXiangQingViewController.h"
#import "UIWindow+YzdHUD.h"


@interface followViewController ()<UITableViewDataSource,UITableViewDelegate>
{
  
    NSMutableArray *_dataArray;
    
    UITableView *_tableView;

}
@end

@implementation followViewController


-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    

}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];


}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self createTableView];
    
    [self createDataSource];
    
}

-(void)createDataSource{


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    
    
    [manager GET:[NSString stringWithFormat:URL_FOLLOW,self.ifFollow,self.owner_id] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic = [rootDic objectForKey:@"data"];
        
        NSArray *array = [secondDic objectForKey:@"users"];
        
        for (NSDictionary *dic in array) {
            
            followModel *model = [[followModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [_dataArray addObject:model];
        }
        
        
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    

}


-(void)createTableView{

    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];
    
    
    _ADView =[[followADView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    
    _ADView.backgroundColor =[UIColor blackColor];
    
    _tableView.tableHeaderView = _ADView;
    
}

#pragma mark -- tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 70;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

  
    followTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[followTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }
    
    followModel *model = _dataArray[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    DaRenXiangQingViewController *vc = [[DaRenXiangQingViewController alloc]init];

    followModel *model = _dataArray[indexPath.row];
    
    vc.ownerId = model.user_id;
    
    [self.navigationController pushViewController:vc animated:YES];


}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}



@end
