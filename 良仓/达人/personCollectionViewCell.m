//
//  personCollectionViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "personCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation personCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        [self createUI];
    }
    
    return self;
}

-(void)createUI{

    _userImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
    
    [self.contentView addSubview:_userImage];
    

    _nameLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 110, self.frame.size.width, 20)];
    
    _nameLable.font = [UIFont systemFontOfSize:13];
    
    _nameLable.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:_nameLable];
    
    
    _descLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 130, self.frame.size.width, 20)];
    
    _descLable.font = [UIFont systemFontOfSize:11];
    
    _descLable.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:_descLable];
    
}
-(void)configCellWithModel:(daRenZSModel *)model{



    [_userImage sd_setImageWithURL:[NSURL URLWithString:model.user_image]];
    
    _nameLable.text = model.user_name;
    
    _descLable.text = model.user_desc;
    
}











@end
