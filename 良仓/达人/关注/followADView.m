//
//  followADView.m
//  良仓
//
//  Created by 宋成博 on 16/1/14.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "followADView.h"

@implementation followADView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self createSubView];
        
        
    }

    return self;
    
}

-(void)createSubView{



    _myLable =[[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width, self.frame.size.height)];
    
    NSString *showText = [[NSUserDefaults standardUserDefaults] objectForKey:@"follow"];

    _myLable.text = showText;
    
    _myLable.textColor =[UIColor whiteColor];
    
    _myLable.font = [UIFont systemFontOfSize:15];
    
    [self addSubview:_myLable];


}

@end
