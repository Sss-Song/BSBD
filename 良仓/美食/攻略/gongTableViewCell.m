//
//  gongTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "gongTableViewCell.h"

#import "UIImageView+WebCache.h"

@implementation gongTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        [self createUI];
        
    }
    
    return self;
}


-(void)createUI{


    CGFloat xSpace = [UIScreen mainScreen].bounds.size.width;
    
    _categoryLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, xSpace, 20)];
    
    _categoryLable.backgroundColor = [UIColor clearColor];
   
    //_categoryLable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_cell_top.png"]];
    _categoryLable.textColor = [UIColor blackColor];
    
    _categoryLable.font = [UIFont systemFontOfSize:15];
    _categoryLable.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:_categoryLable];
       
    _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(20,30, xSpace-40, 150)];
    
    [self.contentView addSubview:_iconView];

    
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 190, xSpace, 30)];
    
    _titleLable.textColor = [UIColor blackColor];
    
    _titleLable.font = [UIFont systemFontOfSize:14];
    
   // _titleLable.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:_titleLable];
    
    
    
    _viceLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 220, xSpace, 20)];
    
    _viceLable.textColor = [UIColor lightGrayColor];
    
    _viceLable.font = [UIFont systemFontOfSize:11];
    
    [self.contentView addSubview:_viceLable];
    
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 245, xSpace-40, 1)];
    
    lable.backgroundColor = [UIColor blackColor];
    
    [self.contentView addSubview:lable];
    
    
}


-(void)configCellWithModel:(gongModel *)model{


    _categoryLable.text = model.categoryName;
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl]];

    _titleLable.text = model.title;
    
    _viceLable.text = model.viceTitle;

}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
