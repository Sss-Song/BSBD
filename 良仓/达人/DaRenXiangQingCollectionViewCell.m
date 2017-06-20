//
//  DaRenXiangQingCollectionViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/10.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "DaRenXiangQingCollectionViewCell.h"

#import "UIImageView+WebCache.h"

@implementation DaRenXiangQingCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
        [self createUI];
    }
    return self;
}

-(void)createUI{


    _iconImage = [[UIImageView alloc]init];
    
    _iconImage.frame = CGRectMake(0, 0, self.frame.size.width, 200);
    
    [self.contentView addSubview:_iconImage];
    

}

-(void)configCellWithModel:(DRXQModel *)model{

    [_iconImage sd_setImageWithURL:[NSURL URLWithString:model.goods_image]];
    
}



@end
