//
//  commentViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/13.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "commentViewController.h"
#import "commentADView.h"
#import "CommentModel.h"
#import "commentTableViewCell.h"
#import "AFNetworking.h"
#import "Header1.h"

@interface commentViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *_tableView;
    
    NSMutableArray *_tableViewData;

}
@end

@implementation commentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableViewData =[[NSMutableArray alloc]init];
    
    [self createTableView];
    
    [self tableViewData];
   
}


-(void)tableViewData{

  
     
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:URL_COMMENT,self.goods_id] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic =[rootDic objectForKey:@"data"];
        
        NSArray *array = [secondDic objectForKey:@"comments"];
        
        for (NSDictionary *dic in array) {
            
            CommentModel *model = [[CommentModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [_tableViewData addObject:model];
        }
        
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
    

}

-(void)createTableView{

    _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];
    
    
    commentADView *ADView =[[commentADView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    [ADView reloadDataWithUrl:self.goods_image];
    
    _tableView.tableHeaderView = ADView;
    
}

#pragma mark -- tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _tableViewData.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 80;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    commentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[commentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }
    
    CommentModel *model = _tableViewData[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
   
}


@end
