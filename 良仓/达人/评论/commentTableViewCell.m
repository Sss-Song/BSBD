//
//  commentTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/13.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "commentTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation commentTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
        
    }
    
    return self;
}

-(void)createUI{

    
    CGFloat xSpcae = [UIScreen mainScreen].bounds.size.width;

    _commentImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 50, 50)];
    
    _commentImage.layer.cornerRadius = 8;
    
    _commentImage.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_commentImage];
    
    
    _nameLable = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, xSpcae-110, 15)];
    
    _nameLable.textColor = [UIColor blackColor];
    
    _nameLable.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_nameLable];
    
    
    _commentLable = [[UILabel alloc]initWithFrame:CGRectMake(90, 25, xSpcae-110, 45)];
    
    _commentLable.numberOfLines = 0;
    
    _commentLable.textColor = [UIColor grayColor];
    
    _commentLable.font = [UIFont systemFontOfSize:11];
    
    [self.contentView addSubview:_commentLable];
    
    
    
    
    UILabel *lable =[[UILabel alloc]initWithFrame:CGRectMake(20, 78, xSpcae-40, 1)];
    
    lable.backgroundColor =[UIColor lightGrayColor];
    
    [self.contentView addSubview:lable];
    

}

-(void)configCellWithModel:(CommentModel *)model{


    [_commentImage sd_setImageWithURL:[NSURL URLWithString:model.user_image]];

    _nameLable.text = model.user_name;
    
    _commentLable.text = model.msg;

}



- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
