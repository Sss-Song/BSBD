//
//  PlayerTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/7.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "PlayerTableViewCell.h"

#import "UIImageView+WebCache.h"

@implementation PlayerTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
    }
    
    return  self;
}


-(void)createUI{

    CGFloat xSpace = [UIScreen mainScreen].bounds.size.width;
    
    _photoView =[[UIImageView alloc]initWithFrame:CGRectMake((xSpace-40)/2, 10, 40, 40)];
    
    _photoView.layer.cornerRadius = 20;
    
    _photoView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_photoView];
    
    _nameLable = [[UILabel alloc]initWithFrame:CGRectMake((xSpace-150)/2, 60, 150, 15)];
    
    _nameLable.textColor = [UIColor blackColor];
    
    _nameLable.font = [UIFont systemFontOfSize:13];
    
    _nameLable.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:_nameLable];
    
    
    _publishLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, xSpace/2-10, 20)];
    
    _publishLable.textColor = [UIColor grayColor];
    
    _publishLable.textAlignment = NSTextAlignmentRight;
    
    _publishLable.font = [UIFont systemFontOfSize:12];
    
    [self.contentView addSubview:_publishLable];
    
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(xSpace/2-10, 80, 20, 20)];
    lable1.text = @"/";
    
    lable1.font = [UIFont systemFontOfSize:12];
    
    lable1.textColor = [UIColor grayColor];
    
    lable1.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:lable1];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(xSpace/2+10, 83, 15, 15)];
    
    imageView.image = [UIImage imageNamed:@"btn_unfavorite.png"];
    [self.contentView addSubview:imageView];
    
    _interestedLable = [[UILabel alloc]initWithFrame:CGRectMake(xSpace/2+35, 80, xSpace/2-35, 20)];
    
    _interestedLable.textColor = [UIColor grayColor];
    
    _interestedLable.textAlignment = NSTextAlignmentLeft;
    
    _interestedLable.font = [UIFont systemFontOfSize:12];
    
    [self.contentView addSubview:_interestedLable];
    
    
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, xSpace, 30)];
    
    _titleLable.textColor = [UIColor grayColor];
    
    _titleLable.font = [UIFont systemFontOfSize:12];
    
    _titleLable.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:_titleLable];
    
    _iconImgae = [[UIImageView alloc]initWithFrame:CGRectMake(20, 130, xSpace-40, 120)];
    
    _iconImgae.layer.cornerRadius = 8;
    
    _iconImgae.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_iconImgae];
    
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 255, xSpace-40, 1)];
    
    lable2.backgroundColor = [UIColor grayColor];
    
    [self.contentView addSubview:lable2];
    
}

-(void)configCellWithModel:(PlayerModel *)model{


    [_photoView sd_setImageWithURL:[NSURL URLWithString:model.virtualPhotoUrl]];
    
    _nameLable.text = [NSString stringWithFormat:@"玩家:%@",model.virtualName];
    
    _titleLable.text = model.title;
    
    _publishLable.text = [NSString stringWithFormat:@"Time:%@",model.publishTime];
 
    _interestedLable.text = model.interestedNum;
    
    [_iconImgae sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
    
}


- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
