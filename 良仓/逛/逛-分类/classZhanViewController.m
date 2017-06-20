//
//  classZhanViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/5.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "classZhanViewController.h"
#import "giftCollectionViewCell.h"
#import "ZSModel.h"
#import "AFNetworking.h"
#import "Header1.h"
#import "BaseXiangQingViewController.h"
#import "MJRefresh.h"

@interface classZhanViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
{

    NSMutableArray *_dataArray;
    
    UICollectionView *_collectionView;
    
    NSString *_catCode;

    NSInteger _page;
    
    BOOL _isPulling;
    
}
@end

@implementation classZhanViewController

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
    
    _dataArray = [[NSMutableArray alloc]init];
    
    _page = 1;
    
    [self createCollectionView];
    
    [self createDataSource];
    
    [self creatRefresh];
    
    self.navigationController.navigationBar.tintColor =[UIColor blackColor];
}

-(void)creatRefresh{
    
    //给tableview的头 添加一个刷新UI效果和刷新要执行的方法
    [_collectionView addHeaderWithTarget:self action:@selector(pullRrefresh)];
    
    [_collectionView addFooterWithTarget:self action:@selector(pushRefresh)];
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
    
    [manager GET:[NSString stringWithFormat:URL_FL,self.catCode,_page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *array = [rootDic objectForKey:@"data"];
        
        
        if (_isPulling == YES) {
            
            [_dataArray removeAllObjects];
        }
        
        for (NSDictionary *dic in array) {
            
            ZSModel *model = [[ZSModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [_dataArray addObject:model];
        }
        
        if (_isPulling == YES) {
            
            //请求完数据后,结束头部刷新的UI效果
            [_collectionView headerEndRefreshing];
            
        }else{
            //请求完数据后,结束尾部刷新的UI效果
            [_collectionView footerEndRefreshing];
        }

        
        
        [_collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    


}

-(void)createCollectionView{
    
    
    UICollectionViewFlowLayout *flowLayou = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayou.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayou];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [_collectionView registerClass:[giftCollectionViewCell class] forCellWithReuseIdentifier:@"ID"];

}

#pragma mark - collectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _dataArray.count;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((self.view.frame.size.width-30)/2, 260);
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //上、左、下、右
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    giftCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    ZSModel *model = _dataArray[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    ZSModel *model = _dataArray[indexPath.item];
    
    BaseXiangQingViewController *vc = [[BaseXiangQingViewController alloc]init];
    
    vc.title = model.goods_name;
    
    vc.goods_ID = model.goods_id;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
