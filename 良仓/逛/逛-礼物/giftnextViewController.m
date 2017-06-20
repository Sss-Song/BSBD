//
//  giftnextViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/4.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "giftnextViewController.h"
#import "AFNetworking.h"
#import "giftCollectionViewCell.h"
#import "ZSModel.h"
#import "Header1.h"
#import "MJRefresh.h"
#import "xiangQingViewController.h"
#import "BaseXiangQingViewController.h"

@interface giftnextViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
{

    NSMutableArray *_dataArray;
    
    UICollectionView *_collectionView;

    NSInteger _page;
    
    BOOL _isPulling;
    
}
@end

@implementation giftnextViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _isPulling = NO;
    
    _dataArray = [[NSMutableArray alloc]init];
    
    _page = 1;
    
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    [self createDataSource];
    
    [self createCollectionView];
    
     [self creatRefresh];
}

-(void)creatRefresh{



    [_collectionView addHeaderWithTarget:self action:@selector(pullRrefresh)];
    
    [_collectionView addFooterWithTarget:self action:@selector(pushRefresh)];

}

-(void)pullRrefresh{
    
    
    
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
    
    
    
    NSString *str  = URL_LW;
    
    //NSString *str2 = [NSString stringWithFormat:str,_page];
    
    NSString *string  = [NSString stringWithFormat:str,self.list_ID];
    
    NSString *escapedPath = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [manager GET:escapedPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
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
    
    //提前注册
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

    
    ZSModel *model = _dataArray[indexPath.row];
    
    BaseXiangQingViewController *vc = [[BaseXiangQingViewController alloc]init];
    
    vc.title = model.goods_name;
    
    vc.goods_ID = model.goods_id;
    
    [self.navigationController pushViewController:vc animated:YES];
   
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


@end
