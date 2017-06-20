//
//  personCollectionViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "daRenZSModel.h"

@interface personCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *userImage;

@property(nonatomic,strong)UILabel *nameLable;

@property(nonatomic,strong)UILabel *descLable;

-(void)configCellWithModel:(daRenZSModel *)model;

@end
