//
//  shareViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/7.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "shareViewController.h"
#import "DWFlowLayout.h"
#import "DWViewCell.h"
#import "AFNetworking.h"
#import "Header1.h"
#import "UIImageView+WebCache.h"


#define SCREENWITH   [UIScreen mainScreen].bounds.size.width

#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface shareViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


{
    NSMutableArray *_dataArray;
    
    UICollectionView *_collectionView;
    
    
}
@end

@implementation shareViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self createCollectionView];
    
    [self createDataSource];
    

    
}

-(void)createDataSource{

  
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:URL_SHARE parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *array = [rootDic objectForKey:@"data"];
        
        
        for (NSDictionary *dic in array) {
            
           
            [_dataArray addObject:[dic objectForKey:@"goods_image"]];
            
        }
        
        [_collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    


}


-(void)createCollectionView{


    DWFlowLayout *layout = [[DWFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-150) collectionViewLayout:layout];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = [UIColor whiteColor];

    [_collectionView registerClass:[DWViewCell class] forCellWithReuseIdentifier:@"ID"];

}

#pragma mark cell的数量
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

#pragma mark cell的视图
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"ID";
    
    
    DWViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //    NSInteger row = indexPath.row;
   // cell.imageView.image = [UIImage imageNamed:_dataArray[indexPath.row]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_dataArray[indexPath.row]]];
    
    return cell;
}

#pragma mark cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return CGSizeMake(SCREENWITH - 60, SCREENHEIGHT - 64 - 60 - 60);
}

#pragma mark cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击图片%ld",indexPath.row);
}




- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
   
}

@end
