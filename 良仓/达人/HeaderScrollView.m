//
//  HeaderScrollView.m
//  UICollectionView_Base
//
//  Created by 夏婷 on 15/12/2.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "HeaderScrollView.h"

@implementation HeaderScrollView
{
    DRXQADScrollView *_adView;//显示图片的滚动视图
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        _adView = [[DRXQADScrollView alloc]initWithFrame:frame];
        
        _adView.myView = self;
        
        [self addSubview:_adView];
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    
    return self;
}


-(void)setModel:(DRXQADmodel *)model
{
    _model = model;
    
    [_adView reloadWithModel:model];
}

-(void)setMyView:(UIViewController *)myView{

  
    _myView = myView;

}

@end
