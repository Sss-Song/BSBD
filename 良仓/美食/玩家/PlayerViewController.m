//
//  PlayerViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/7.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "PlayerViewController.h"
#import "PlayerTableViewCell.h"
#import "PlayerXiangQingViewController.h"
#import "AFNetworking.h"
#import "Header1.h"
#import "PlayerModel.h"
#import "MJRefresh.h"


@interface PlayerViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray *_dataArray;
    
    UITableView *_tableView;
    
    NSInteger _page;
    
    BOOL _isPulling;

}
@end

@implementation PlayerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    _page = 1;
    
    [self createData];
    
    [self createTableView];
    
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
    
    [self createData];
    
}
-(void)pushRefresh{
    
    _isPulling = NO;
    
    _page ++;
    
    [self createData];
}




-(void)createData{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:URL_PLAYER,_page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *array = [rootDic objectForKey:@"data"];
        
        if (_isPulling == YES) {
            
            [_dataArray removeAllObjects];
        }

        for (NSDictionary *dic in array) {
            
            PlayerModel *model = [[PlayerModel alloc]init];
            
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


-(void)createTableView{

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_tableView];
    
    
    
    UIView *subView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 140)];
    
    subView.backgroundColor =[UIColor whiteColor];
    
    _tableView.tableFooterView = subView;


}

#pragma mark - tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 260;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[PlayerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }


    PlayerModel *model = _dataArray[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PlayerModel *model = _dataArray[indexPath.row];
    
    PlayerXiangQingViewController *vc = [[PlayerXiangQingViewController alloc]init];
    
    vc.shareUrl = model.openUrl;
    
    vc.title = @"详情";
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
