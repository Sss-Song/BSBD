//
//  shiYeTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/7.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "shiYeTableViewCell.h"

#import "UIImageView+WebCache.h"

@implementation shiYeTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
    }
    
    return  self;
}


-(void)createUI{


    CGFloat xSpace = [UIScreen mainScreen].bounds.size.width;
    

    _picUrlView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 130, 100)];
    
    _picUrlView.layer.cornerRadius = 15;
    
    _picUrlView.layer.masksToBounds=YES;
    [self.contentView addSubview:_picUrlView];
    
    
    
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(170, 10, xSpace-170-20, 50)];
    
    _titleLable.numberOfLines = 0;
    
    _titleLable.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:_titleLable];
    

    UILabel *lable =[[UILabel alloc]initWithFrame:CGRectMake(20, 240, xSpace-40, 1)];
    
    lable.backgroundColor =[UIColor lightGrayColor];
    
    [self.contentView addSubview:lable];
    
    
    _descriptionLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, xSpace-40, 100)];
    
    _descriptionLable.textColor = [UIColor grayColor];
    
    _descriptionLable.font = [UIFont systemFontOfSize:13];
    
    _descriptionLable.numberOfLines = 0;
    
    [self.contentView addSubview:_descriptionLable];

}



-(void)configCellWithModel:(ShiYeGGModel *)model{


    [_picUrlView sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];

    _titleLable.text = model.title;
    
    _descriptionLable.text = model.description;
   
}

- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
