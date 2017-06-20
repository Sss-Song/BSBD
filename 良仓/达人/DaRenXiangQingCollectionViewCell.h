//
//  DaRenXiangQingCollectionViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/10.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "DRXQModel.h"
@interface DaRenXiangQingCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *iconImage;

-(void)configCellWithModel:(DRXQModel *)model;


@end
