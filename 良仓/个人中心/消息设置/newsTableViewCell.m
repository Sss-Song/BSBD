//
//  newsTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/18.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "newsTableViewCell.h"

@implementation newsTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
    }

    return self;

}

-(void)createUI{


   _firstLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 20)];
    
    _firstLable.font =[UIFont systemFontOfSize:15];
    
    _firstLable.textColor =[UIColor blackColor];
    
    [self.contentView addSubview:_firstLable];
    

    CGFloat xspace = [UIScreen mainScreen].bounds.size.width;

    _nextLable =[[UILabel alloc]initWithFrame:CGRectMake(xspace-150, 10, 130, 20)];
    
    _nextLable.textAlignment = NSTextAlignmentRight;
    
    _nextLable.textColor =[UIColor grayColor];
    
    _nextLable.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_nextLable];
    
    
    UILabel *lable =[[UILabel alloc]initWithFrame:CGRectMake(20, 38, xspace-40, 0.5)];
    
    lable.backgroundColor =[UIColor lightGrayColor];
    
    [self.contentView addSubview:lable];


}



- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
