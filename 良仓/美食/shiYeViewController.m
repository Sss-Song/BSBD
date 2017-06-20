//
//  shiYeViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "shiYeViewController.h"
#import "shiYeTableViewCell.h"
#import "xiangQingShiYeViewController.h"
#import "findViewController.h"
#import "AFNetworking.h"
#import "ShiYeGGModel.h"
#import "Header1.h"
#import "MJRefresh.h"

@interface shiYeViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray *_dataArrayHeard;
    
    NSMutableArray *_dataArray;
    
    UITableView *_tableView;
    
    NSInteger _page;
    
    BOOL _isPulling;

}
@end

@implementation shiYeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    _page = 1;
    
    [self createTbaleView];
    
    [self createTableViewData];
    
    [self creatRefresh];
}

-(void)creatRefresh{
    
    //给tableview的头 添加一个刷新UI效果和刷新要执行的方法
    [_tableView addHeaderWithTarget:self action:@selector(pullRrefresh)];
    
    [_tableView addFooterWithTarget:self action:@selector(pushRefresh)];
}
-(void)pullRrefresh{
    
    NSLog(@"下啦刷新");
    
    _isPulling = YES;
    //重新请求一遍第一页的数据
    _page = 1;
    
    [self createTableViewData];
    
}
-(void)pushRefresh{
    
    _isPulling = NO;
    
    _page ++;
    
    [self createTableViewData];
}


-(void)createTableViewData{
    
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:URL_SYVIEW,_page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic = [rootDic objectForKey:@"data"];
        
        NSArray *array = [secondDic objectForKey:@"doc"];
        
        if (_isPulling == YES) {
            
            [_dataArray removeAllObjects];
        }
        
        for (NSDictionary *dic in array) {
            
            ShiYeGGModel *model = [[ShiYeGGModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [_dataArray addObject:model];
            
        }
        
        if (_isPulling == YES) {
            
            //请求完数据后,结束头部刷新的UI效果
            [_tableView headerEndRefreshing];
            
        }else{
            //请求完数据后,结束尾部刷新的UI效果
            [_tableView footerEndRefreshing];
        }

        
        
        [_tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

-(void)createTbaleView{

  
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *subView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 140)];
    subView.backgroundColor =[UIColor whiteColor];
    
    _tableView.tableFooterView = subView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 250;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    shiYeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[shiYeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }

    ShiYeGGModel *model = _dataArray[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    ShiYeGGModel *model = _dataArray[indexPath.row];
    
    xiangQingShiYeViewController *vc = [[xiangQingShiYeViewController alloc]init];
    
    vc.openUrl = model.openUrl;
   
    vc.title = @"详情";
    
    [self.navigationController pushViewController:vc animated:YES];

}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
   
}


@end
