//
//  firstTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 15/12/31.
//  Copyright © 2015年 宋成博. All rights reserved.
//

#import "firstTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation firstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
        
    }

    return self;
}

-(void)createUI{

    
    CGFloat xSpace = [UIScreen mainScreen].bounds.size.width;
    
    _goodsImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 80)];
    [self.contentView addSubview:_goodsImage];
    
    _goodsName = [[UILabel alloc]initWithFrame:CGRectMake(130, 20, xSpace-140, 40)];
    _goodsName.textAlignment = NSTextAlignmentLeft;
    
    _goodsName.font = [UIFont systemFontOfSize:14];
    
    _goodsName.numberOfLines = 0;
    
    [self.contentView addSubview:_goodsName];
    
    
    _price = [[UILabel alloc]initWithFrame:CGRectMake(130, 60, 100, 20)];
    
    _price.font = [UIFont systemFontOfSize:11];
    
    _price.textColor = [UIColor grayColor];
    
    _price.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_price];
    
    _likeLable = [[UILabel alloc]initWithFrame:CGRectMake(250, 60, xSpace-260, 20)];
    
    _likeLable.textColor = [UIColor grayColor];
    
    _likeLable.font = [UIFont systemFontOfSize:11];
    
    [self.contentView addSubview:_likeLable];
    
    
}


-(void)configCellWithModel:(tuiJianModel *)model{



    [_goodsImage sd_setImageWithURL:[NSURL URLWithString:model.goods_image]];
    
    _goodsName.text = model.goods_name;
    
    _price.text = [NSString stringWithFormat:@" $ %@",model.price];
    
    _likeLable.text = [NSString stringWithFormat:@"销量:%@",model.like_count];

}


- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
