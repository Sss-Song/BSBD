//
//  ADScrollView.h
//  CutomCellDemo
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADScrollView : UIView<UIScrollViewDelegate>

@property(nonatomic,strong)UIViewController *myView;

-(void)reloadDataWithImageArray:(NSArray *)array;

-(void)reloadDataWithImageArray2:(NSArray *)array2;



@end
