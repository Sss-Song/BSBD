//
//  DaRenXiangQingViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/9.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "DaRenXiangQingViewController.h"
#import "DaRenXiangQingCollectionViewCell.h"
#import "AFNetworking.h"
#import "HeaderScrollView.h"
#import "Header1.h"
#import "DRXQADmodel.h"
#import "DRXQModel.h"
#import "DRTJXQViewController.h"



@interface DaRenXiangQingViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    
    NSMutableArray *_collectionViewData;
    
    UICollectionView *_collectionView;
    
    NSMutableArray *_ADdata;
    
}
@end

@implementation DaRenXiangQingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
   
    _collectionViewData =[[NSMutableArray alloc]init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createCollectionView];
    
    [self createADdata];
    
    [self createCollectionViewData];
    
}

-(void)createADdata{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *str  = URL_DRXQ;
    
    NSString *string  = [NSString stringWithFormat:str,self.ownerId];
    
    NSString *escapedPath = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [manager GET:escapedPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic = [rootDic objectForKey:@"data"];
        
        DRXQADmodel *model = [[DRXQADmodel alloc]init];
        
        [model setValuesForKeysWithDictionary:secondDic];
        
        HeaderScrollView *scrollView = (id)[self.view viewWithTag:100];
        
        scrollView.model = model;
        
        scrollView.myView = self;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

-(void)createCollectionViewData{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *str  = URL_DRXQ;
    
    NSString *string  = [NSString stringWithFormat:str,self.ownerId];
    
    NSString *escapedPath = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [manager GET:escapedPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *secondDic =[rootDic objectForKey:@"data"];

        NSArray *array = [secondDic objectForKey:@"goods"];
        
        for (NSDictionary *dic in array) {
            
            DRXQModel *model = [[DRXQModel alloc]init];
        
            [model setValuesForKeysWithDictionary:dic];
            
            [_collectionViewData addObject:model];
            
        }
    
        [_collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

-(void)createCollectionView{

    UICollectionViewFlowLayout *flowLayou = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayou.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) collectionViewLayout:flowLayou];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
   _collectionView.backgroundColor =[UIColor whiteColor];
    // _collectionView.backgroundColor =[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[DaRenXiangQingCollectionViewCell class] forCellWithReuseIdentifier:@"ID"];
    
    [_collectionView registerClass:[HeaderScrollView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header0"];
    
}


#pragma mark - collectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _collectionViewData.count;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((self.view.frame.size.width-30)/2, 210);
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //上、左、下、右
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
     DaRenXiangQingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    DRXQModel *model = _collectionViewData[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *headerID = @"header0";
    
    HeaderScrollView *scrollView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
    
    scrollView.myView = self;
    
    scrollView.tag = 100;
    
    return scrollView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 150);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    DRTJXQViewController *vc = [[DRTJXQViewController alloc]init];
    
    DRXQModel *model = _collectionViewData[indexPath.row];
    
    vc.goods_id = model.goods_id;
    
    vc.title = @"达人推荐详情";
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
