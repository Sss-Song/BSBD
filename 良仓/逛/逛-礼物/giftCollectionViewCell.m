//
//  giftCollectionViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/4.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "giftCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation giftCollectionViewCell



-(instancetype)initWithFrame:(CGRect)frame{


    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        [self createUI];
    }

    return self;
}

-(void)createUI{
   
    _goodsView = [[UIImageView alloc]init];
    
    _goodsView.frame = CGRectMake(0, 0, self.frame.size.width, 200);
    
    [self.contentView addSubview:_goodsView];
    
    _nameLable = [[UILabel alloc]init];
    _nameLable.frame = CGRectMake(10, 210, self.frame.size.width-20, 20);
    _nameLable.font = [UIFont systemFontOfSize:13];
    
    _nameLable.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:_nameLable];
    
    _priceLable = [[UILabel alloc]init];
    
    _priceLable.frame = CGRectMake(10, 240, self.frame.size.width-100, 20);
    
    _priceLable.font = [UIFont systemFontOfSize:13];
    
    _priceLable.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:_priceLable];
    
    _xinView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-60, 240, 20, 20)];
    
    _xinView.image = [UIImage imageNamed:@"btn_cell_favorite4.png"];
    
    [self.contentView addSubview:_xinView];
    
    _likeLable = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-35, 240, 30, 20)];
    
    _likeLable.font = [UIFont systemFontOfSize:13];
    
    _likeLable.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:_likeLable];
    
    
}
-(void)configCellWithModel:(ZSModel *)model{

    
    [_goodsView sd_setImageWithURL:[NSURL URLWithString:model.goods_image]];
    
    _nameLable.text = model.goods_name;
    

    _priceLable.text = [NSString stringWithFormat:@"💰 %@",model.price];
    _likeLable.text = model.like_count;
    
}

@end
