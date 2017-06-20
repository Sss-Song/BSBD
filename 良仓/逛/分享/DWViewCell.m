//
//  DWViewCell.m
//  CardSlide
//
//  Created by DavidWang on 15/11/25.
//  Copyright © 2015年 DavidWang. All rights reserved.
//

#import "DWViewCell.h"

@implementation DWViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createUI];
        
    }
    
    return self;
}

-(void)createUI{

    
    CGFloat xSpace = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat vSpace = [UIScreen mainScreen].bounds.size.height;
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 50, xSpace-100, vSpace-280)];
    
    _imageView.layer.cornerRadius = 8;
    
    _imageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_imageView];

}



- (void)awakeFromNib {
//    self.layer.cornerRadius = 5.0f;
//    
//    CALayer *layer = [self layer];
//    layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    layer.borderWidth = 1.0f;
//    
//    self.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.layer.shadowOffset = CGSizeMake(0, 0);
//    self.layer.shadowOpacity = 0.5;
//    self.layer.shadowRadius = 10.0;
}

@end
