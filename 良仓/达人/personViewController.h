//
//  personViewController.h
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface personViewController : UIViewController

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,retain)NSMutableArray *dataArray;

@property(nonatomic,copy)NSString *classID;

-(void)createDataSource;

@end
