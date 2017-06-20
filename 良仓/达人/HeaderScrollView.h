//
//  HeaderScrollView.h
//  UICollectionView_Base
//
//  Created by 夏婷 on 15/12/2.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRXQADScrollView.h"
#import "DRXQADmodel.h"


@interface HeaderScrollView : UICollectionReusableView

@property(nonatomic,strong)UIViewController *myView;

@property (nonatomic,strong)DRXQADmodel *model;

@end
