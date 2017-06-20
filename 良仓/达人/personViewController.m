//
//  personViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "personViewController.h"
#import "personCollectionViewCell.h"
#import "DaRenXiangQingViewController.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "daRenZSModel.h"
#import "Header1.h"

@interface personViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation personViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    self.classID = @"";
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    menuButton.frame = CGRectMake(0, 0, 25, 20);
    
    [menuButton setBackgroundImage:[UIImage imageNamed:@"btn_nav_option_h4.png"] forState:UIControlStateNormal];
    
    [menuButton addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:menuButton];
    
    [self caeateCollectionView];
    
    [self createDataSource];

}

-(void)openOrCloseLeftList{

    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
       AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
    
    }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}

-(void)createDataSource{

    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:URL_DR,self.classID] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        
        NSArray *array = [rootDic objectForKey:@"data"];
        
        
        for (NSDictionary *dic in array) {
            
            daRenZSModel *model = [[daRenZSModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            
            [_dataArray addObject:model];
            
        }

        [_collectionView reloadData];
        

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)caeateCollectionView{


    UICollectionViewFlowLayout *flowLayou = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayou.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayou];
    
    _collectionView.delegate = self;
    
    _collectionView.dataSource = self;
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[personCollectionViewCell class] forCellWithReuseIdentifier:@"ID"];

}

#pragma mark - collectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _dataArray.count;

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((self.view.frame.size.width-40)/3,150);
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //上、左、下、右
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    personCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];

    daRenZSModel *model = _dataArray[indexPath.row];
    
    [cell configCellWithModel:model];
    
    return cell;
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    
    daRenZSModel *model = _dataArray[indexPath.row];

    DaRenXiangQingViewController *vc = [[DaRenXiangQingViewController alloc]init];
    
    vc.ownerId = model.user_id;
    
    vc.title = model.user_name;
    
    [self.navigationController pushViewController:vc animated:YES];
    

}





- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
