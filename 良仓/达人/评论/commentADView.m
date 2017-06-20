//
//  commentADView.m
//  良仓
//
//  Created by 宋成博 on 16/1/13.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "commentADView.h"
#import "UIImageView+WebCache.h"

@implementation commentADView
{
  
    UIImageView *_imageView;

}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        
    }
   
    return self;
}

-(void)createUI{


    _imageView = [[UIImageView alloc]init];
    
    _imageView.frame = CGRectMake(20, 20,self.frame.size.width-40, self.frame.size.height-50);
    
    [self addSubview:_imageView];
    
    UILabel *lable =[[UILabel alloc]initWithFrame:CGRectMake(20, self.frame.size.height-20, self.frame.size.width-40, 20)];
    
    lable.text = @"评论";
    
    lable.textColor =[UIColor blackColor];
    
    lable.font =[UIFont systemFontOfSize:15];
    
    [self addSubview:lable];
    
    
    
}

-(void)reloadDataWithUrl:(NSString *)url{

    [_imageView sd_setImageWithURL:[NSURL URLWithString:url]];

}

@end
