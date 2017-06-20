//
//  gongViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "gongViewController.h"
#import "AFNetworking.h"
#import "Header1.h"
#import "gongModel.h"
#import "gongTableViewCell.h"
#import "gongXiangQingViewController.h"
#import "MJRefresh.h"

@interface gongViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView *_tableView;
    
    NSInteger _page;
    
    BOOL _isPulling;
    
}
@end

@implementation gongViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    _page = 1;
    
    self.url = @"740D3687814B02154E948FE29CC0E792IuxUA1D9lN2OB00GiA6QJw==&cityid=1";
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self createTableView];
    
    [self createDataSource];
    
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
    
    [self createDataSource];
    
}
-(void)pushRefresh{
    
    _isPulling = NO;
    
    _page ++;
    
    [self createDataSource];
}

-(void)createDataSource{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
   
    
    [manager GET:[NSString stringWithFormat:URL_GL,self.url,_page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic = [rootDic objectForKey:@"data"];
        
        NSArray *array = [secondDic objectForKey:@"doc"];
        
        if (_isPulling == YES) {
            
            [_dataArray removeAllObjects];
        }
        
        for (NSDictionary *dic in array) {
            
         gongModel *model = [[gongModel alloc]init];
            
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
    
    
    
    
    UIView *view = [[UIView alloc]init];
    
    view.frame = CGRectMake(0, 0, self.view.frame.size.width, 10);
    
    view.backgroundColor = [UIColor clearColor];
    
    _tableView.tableHeaderView = view;
    
    
    
    
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

    gongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        
        cell = [[gongTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    gongModel *model = _dataArray[indexPath.row];
    
    [cell configCellWithModel:model];

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    gongModel *model = _dataArray[indexPath.row];
    
    gongXiangQingViewController *vc = [[gongXiangQingViewController alloc]init];
    
    vc.shareUrl = model.targetUrl;
    
    vc.title = model.categoryName;
    
    [self.navigationController pushViewController:vc animated:YES];

}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}
@end
