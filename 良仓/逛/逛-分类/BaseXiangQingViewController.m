//
//  BaseXiangQingViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/8.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "BaseXiangQingViewController.h"
#import "BaseXiangQingTableViewCell.h"
#import "BaseADScrollView.h"
#import "AFNetworking.h"
#import "Header1.h"
#import "xiangQingModel.h"
#import "UMSocial.h"


@interface BaseXiangQingViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UMSocialUIDelegate>
{

    NSMutableArray *_heardData;
    
    NSMutableArray *_tableViewData;
    
    UITableView *_tableView;
    
    NSString *_shareStr;


    CGFloat a;
    
    CGFloat b;
    
    
}
@end

@implementation BaseXiangQingViewController


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
    
    _heardData = [[NSMutableArray alloc]init];
    
    _tableViewData = [[NSMutableArray alloc]init];
    
    [self createTableView];
    
    [self createHeardData];
    
    [self createTableViewData];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:15],NSForegroundColorAttributeName:[UIColor blackColor]};
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setBackgroundImage:[UIImage imageNamed:@"topmenu_share.png"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(itemClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = item;
    
    
}

-(void)itemClicked{
    
    
    
    
    [UMSocialSnsService presentSnsIconSheetView:self
     appKey:@"568f91ffe0f55a8f9b00169f"shareText:_shareStr shareImage:[UIImage imageNamed:@"city.png"]shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,UMShareToRenren,UMShareToTencent,UMShareToWechatTimeline,nil]delegate:self];

}

-(void)createHeardData{


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    NSString *str  = URL_XQQ;
    
    NSString *string  = [NSString stringWithFormat:str,self.goods_ID];
    
    NSString *escapedPath = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [manager GET:escapedPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic = [rootDic objectForKey:@"data"];
        
        NSArray *array = [secondDic objectForKey:@"images_item"];
        
        for (int i = 0; i<array.count; i++) {
            
            [_heardData addObject:array[i]];
        }
        
        BaseADScrollView *ADView = (id)[self.view viewWithTag:100];
        
        [ADView reloadDataWithImageArray:_heardData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    

}

-(void)createTableViewData{

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *str  = URL_XQQ;
    
    NSString *string  = [NSString stringWithFormat:str,self.goods_ID];
    
    NSString *escapedPath = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [manager GET:escapedPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic = [rootDic objectForKey:@"data"];
        
        xiangQingModel *model = [[xiangQingModel alloc]init];
        
        [model setValuesForKeysWithDictionary:secondDic];
        
       a=[self sizeWithString:model.goods_desc font:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(self.view.frame.size.width-40, MAXFLOAT)].height;
        
       b=[self sizeWithString:model.rec_reason font:[UIFont systemFontOfSize:13]maxSize:CGSizeMake(self.view.frame.size.width-40, MAXFLOAT)].height;
        
        
        
        
        
        
        
        
        _shareStr = [[NSString alloc]initWithString:model.rec_reason];
        
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
    
    //_tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+64) style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    BaseADScrollView *ADView = [[BaseADScrollView alloc]initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 200)];
    
    ADView.tag = 100;
    
    _tableView.tableHeaderView = ADView;
    
    
}

#pragma mark - tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return _tableViewData.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return a+b+400;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BaseXiangQingTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ID"];

    if (!cell) {
        
        cell = [[BaseXiangQingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }
    
    xiangQingModel *model = _tableViewData[indexPath.row];
    
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
