//
//  firstViewController.m
//  良仓
//
//  Created by 宋成博 on 15/12/30.
//  Copyright © 2015年 宋成博. All rights reserved.
//

#import "firstViewController.h"
#import "firstTableViewCell.h"
#import "ADScrollView.h"
#import "AFNetworking.h"
#import "Header1.h"
#import "tuiJianModel.h"
#import "BaseXiangQingViewController.h"
#import "shouYeADModel.h"
#import "shouYeADDModel.h"




@interface firstViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
    NSMutableArray *_headerDataArray;
    
    NSMutableArray *_headerDataArray2;
    
    NSMutableArray *_tableViewDataArray;
    
}
@end

@implementation firstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    _headerDataArray = [[NSMutableArray alloc]init];
    
    _headerDataArray2 = [[NSMutableArray alloc]init];

    _tableViewDataArray = [[NSMutableArray alloc]init];
    
    [self createData];
    
    [self createTableView];
    
    [self createTableViewData];
    
    //self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:15],NSForegroundColorAttributeName:[UIColor blackColor]};
    
}



-(void)createData{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:URL_SHOUYE parameters:self success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic = [rootDic objectForKey:@"slide"];
        
        NSArray *array = [secondDic objectForKey:@"data"];
        
        for (NSDictionary *dic in array) {
            
            shouYeADModel *model = [[shouYeADModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [_headerDataArray addObject:model];
            
        }
        
        
        NSDictionary *thirdDic = [rootDic objectForKey:@"list"];
      
        NSArray *thirdArray = [thirdDic objectForKey:@"list"];
        
        NSDictionary *dic1 = thirdArray[0];
        NSDictionary *dic2 = thirdArray[1];
        NSDictionary *dic3 = thirdArray[2];
        
        NSDictionary *oneDic = [dic1 objectForKey:@"one"];
        shouYeADDModel *oneModel = [[shouYeADDModel alloc]init];
        [oneModel setValuesForKeysWithDictionary:oneDic];
        [_headerDataArray2 addObject:oneModel];
        
        NSDictionary *twoDic = [dic1 objectForKey:@"two"];
        shouYeADDModel *twoModel = [[shouYeADDModel alloc]init];
        [twoModel setValuesForKeysWithDictionary:twoDic];
        [_headerDataArray2 addObject:twoModel];
        
        NSDictionary *threeDic = [dic1 objectForKey:@"three"];
        shouYeADDModel *threeModel = [[shouYeADDModel alloc]init];
        [threeModel setValuesForKeysWithDictionary:threeDic];
        [_headerDataArray2 addObject:threeModel];
        
        
        NSDictionary *fourDic = [dic1 objectForKey:@"four"];
        shouYeADDModel *fourModel = [[shouYeADDModel alloc]init];
        [fourModel setValuesForKeysWithDictionary:fourDic];
        [_headerDataArray2 addObject:fourModel];
        
        NSDictionary *fiveDic = [dic2 objectForKey:@"one"];
        shouYeADDModel *fiveModel = [[shouYeADDModel alloc]init];
        
        [fiveModel setValuesForKeysWithDictionary:fiveDic];
        
        [_headerDataArray2 addObject:fiveModel];
        
        NSDictionary *sixDic = [dic3 objectForKey:@"one"];
        shouYeADDModel *sixModel = [[shouYeADDModel alloc]init];
        [sixModel setValuesForKeysWithDictionary:sixDic];
        [_headerDataArray2 addObject:sixModel];
        
        NSDictionary *sevenDic = [dic3 objectForKey:@"two"];
        shouYeADDModel *sevenModel = [[shouYeADDModel alloc]init];
        [sevenModel setValuesForKeysWithDictionary:sevenDic];
        
        [_headerDataArray2 addObject:sevenModel];
        
        
        
        ADScrollView *ADView = (id)[self.view viewWithTag:10];
        
        [ADView reloadDataWithImageArray:_headerDataArray];
        
        [ADView reloadDataWithImageArray2:_headerDataArray2];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)createTableViewData{


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:URL_SHOUYETB parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *array =[rootDic objectForKey:@"data"];
        
        for (NSDictionary *dic in array) {
            
            
            tuiJianModel *model = [[tuiJianModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [_tableViewDataArray addObject:model];
            
            
        }
        
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}



-(void)createTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    //创建广告栏
    ADScrollView *AdView = [[ADScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 440)];
    
    _tableView.tableHeaderView = AdView;
    
    AdView.myView = self;
    
    AdView.tag = 10;
    
    
    UIView *subView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 130)];
    
    subView.backgroundColor =[UIColor whiteColor];
    
    _tableView.tableFooterView = subView;
    
}



#pragma mark - tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _tableViewDataArray.count;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    firstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[firstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    tuiJianModel *model = _tableViewDataArray[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    tuiJianModel *model = _tableViewDataArray[indexPath.row];
    
    BaseXiangQingViewController *vc = [[BaseXiangQingViewController alloc]init];
    
    vc.goods_ID = model.goods_id;

    vc.title = model.goods_name;
    
    [self.navigationController pushViewController:vc animated:YES];
    

}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
