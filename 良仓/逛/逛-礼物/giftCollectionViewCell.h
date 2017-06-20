//
//  giftCollectionViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/4.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZSModel.h"
@interface giftCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *goodsView;

@property(nonatomic,strong)UILabel *nameLable;

@property(nonatomic,strong)UILabel *priceLable;

@property(nonatomic,strong)UILabel *likeLable;

@property(nonatomic,strong)UIImageView *xinView;

-(void)configCellWithModel:(ZSModel *)model;

@end
