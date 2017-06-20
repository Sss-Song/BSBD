//
//  tuiChuTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/16.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "tuiChuTableViewCell.h"

@implementation tuiChuTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self createUI];
        
    }
    
    return self;

}

-(void)createUI{


    CGFloat xspace = [UIScreen mainScreen].bounds.size.width;
    
    _textLable = [[UILabel alloc]initWithFrame:CGRectMake(17, 10, 150, 20)];
    
    _textLable.textColor =[UIColor blackColor];
    
    _textLable.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:_textLable];
    
    _subLable =[[UILabel alloc]initWithFrame:CGRectMake(xspace-190, 10, 170, 20)];
    
    _subLable.textColor =[UIColor grayColor];
    
    _subLable.font =[UIFont systemFontOfSize:11];
    
    [self.contentView addSubview:_subLable];
    
    _tuichuLable =[[UILabel alloc]initWithFrame:CGRectMake(xspace/2-50, 10, 100, 20)];
    
    _tuichuLable.textColor = [UIColor blackColor];
    
    _tuichuLable.font =[UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:_tuichuLable];
    
    
    
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
