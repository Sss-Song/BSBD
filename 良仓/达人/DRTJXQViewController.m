//
//  DRTJXQViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/11.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "DRTJXQViewController.h"
#import "DRTJXQTableViewCell.h"
#import "AFNetworking.h"
#import "Header1.h"
#import "DRTJXQADView.h"



@interface DRTJXQViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray *_tableViewData;
    
    NSMutableArray *_ADdata;
    
    UITableView *_tableView;

    NSString *_shareImgae;
    
    NSString *_shareDesc;
    
    CGFloat a;
    
}
@end

@implementation DRTJXQViewController


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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"推荐详情";
    
     self.view.backgroundColor =[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    
    _ADdata = [[NSMutableArray alloc]init];
    
    _tableViewData = [[NSMutableArray alloc]init];
    
    [self createTableView];
    
    [self createTableViewData];
    
    [self createADdata];

}

-(void)createADdata{

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:URL_DRTJXQ,self.goods_id] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic = [rootDic objectForKey:@"data"];
        DRTJXQModel *model = [[DRTJXQModel alloc]init];
        
        [model setValuesForKeysWithDictionary:secondDic];
        
        _shareImgae = [[NSString alloc]initWithString:model.goods_image];
        
        _shareDesc = [[NSString alloc]initWithString:model.goods_desc];
        
        DRTJXQADView *ADView =(id)[self.view viewWithTag:100];
        
        [ADView reloadDataWithDate:model];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
}

-(void)createTableViewData{

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:URL_DRTJXQ,self.goods_id] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic = [rootDic objectForKey:@"data"];
        
        DRTJXQModel *model = [[DRTJXQModel alloc]init];
        
        [model setValuesForKeysWithDictionary:secondDic];
        
        
        a = [self sizeWithString:model.goods_desc font:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(self.view.frame.size.width-40, MAXFLOAT)].height;
        
        [_tableViewData addObject:model];
        
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

-(void)createTableView{


    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44) style:UITableViewStylePlain];
    

    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_tableView];
    
    DRTJXQADView *ADView = [[DRTJXQADView alloc]initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, 370)];
    
    ADView.myView = self;
    
    ADView.tag = 100;
    
    _tableView.tableHeaderView = ADView;
    
}


#pragma mark -- tableView


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _tableViewData.count;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return a+200;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    DRTJXQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    cell.myView = self;
    
    if (!cell) {
        
        cell = [[DRTJXQTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }
    
    DRTJXQModel *model = _tableViewData[indexPath.row];
  
    [cell configCellWithModel:model];

    return cell;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:NO];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}




@end
