//
//  zhuanTiViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/4.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "zhuanTiViewController.h"
#import "zhuanTiTableViewCell.h"
#import "Header1.h"
#import "AFNetworking.h"
#import "zhuantiModel.h"
#import "zhuanTiXiangViewController.h"

@interface zhuanTiViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray *_dataArray;
    
    UITableView *_tableView;

}
@end

@implementation zhuanTiViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self createDataSoure];
    
    [self createTableView];
    
}

-(void)createDataSoure{
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:URL_ZT parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *array = [rootDic objectForKey:@"data"];
        
        for (NSDictionary *dic in array) {
            
            zhuantiModel *model = [[zhuantiModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [_dataArray addObject:model];
        }
        
        [_tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

-(void)createTableView{


    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 130)];
    
    subView.backgroundColor =[UIColor whiteColor];
    
    _tableView.tableFooterView = subView;
    

}

#pragma mark - tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    zhuanTiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[zhuanTiTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    zhuantiModel *model = _dataArray[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    zhuantiModel *model = _dataArray[indexPath.row];
    
    zhuanTiXiangViewController *vc = [[zhuanTiXiangViewController alloc]init];
    
    vc.topic = model.topic_url;
    
    vc.title = model.topic_name;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
