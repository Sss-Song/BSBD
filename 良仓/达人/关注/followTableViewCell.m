//
//  followTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/14.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "followTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation followTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
    }

    return self;

}


-(void)createUI{


    CGFloat xsapce = [UIScreen mainScreen].bounds.size.width;
    
    
    _userView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 50, 50)];
    
    _userView.layer.cornerRadius = 25;
    
    _userView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_userView];

    
    _nameLable =[[UILabel alloc]initWithFrame:CGRectMake(90, 10, xsapce-120, 20)];
    
    _nameLable.textColor =[UIColor blackColor];
    
    _nameLable.font = [UIFont systemFontOfSize:13];
    
    [self addSubview:_nameLable];
    
    
    _descLable = [[UILabel alloc]initWithFrame:CGRectMake(90, 35, xsapce-120, 20)];
    
    _descLable.textColor =[UIColor grayColor];
    
    _descLable.font = [UIFont systemFontOfSize:13];
    
    [self addSubview:_descLable];

    UILabel *lable =[[UILabel alloc]initWithFrame:CGRectMake(20, 65, xsapce-40, 1)];
    lable.backgroundColor =[UIColor lightGrayColor];
    
    [self.contentView addSubview:lable];
    

}

-(void)configCellWithModel:(followModel *)model{

    [_userView sd_setImageWithURL:[NSURL URLWithString:model.user_image]placeholderImage:[UIImage imageNamed:@"daren.png"]];
    
    _nameLable.text = model.user_name;
    
    _descLable.text = model.user_desc;
    
}


- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
