//
//  zhuanTiTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/4.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "zhuanTiTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation zhuanTiTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
    }

    return  self;
}

-(void)createUI{
    
    CGFloat xSpace = [UIScreen mainScreen].bounds.size.width;
    
    _coverImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, xSpace, 200)];
    
    [self.contentView addSubview:_coverImage];
    
    
    _nameLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, xSpace,30)];
    
    _nameLable.textAlignment = NSTextAlignmentCenter;
    
    _nameLable.textColor = [UIColor whiteColor];
    
    _nameLable.font = [UIFont systemFontOfSize:18];
    
    [self.contentView addSubview:_nameLable];

}

-(void)configCellWithModel:(zhuantiModel *)model{

    [_coverImage sd_setImageWithURL:[NSURL URLWithString:model.cover_img]];
    
    _nameLable.text = model.topic_name;

}
- (void)awakeFromNib {
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
