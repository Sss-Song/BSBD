//
//  DRTJXQADView.m
//  良仓
//
//  Created by 宋成博 on 16/1/13.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "DRTJXQADView.h"
#import "UIImageView+WebCache.h"
#import "commentViewController.h"
@implementation DRTJXQADView
{

    UIImageView *_goodView;

    UILabel *_lable;
    
    UIButton *_button;
    
    
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
        [self createUI];
        
    }
    return self;
}

-(void)createUI{


    _goodView = [[UIImageView alloc]init];
    
    _goodView.frame = CGRectMake(0, 10, self.frame.size.width, self.frame.size.height-20);
    
    [self addSubview:_goodView];
    
    
    _lable =[[UILabel alloc]init];
    
    _lable.frame = CGRectMake(0, self.frame.size.height-40, self.frame.size.width, 40);
    
    _lable.backgroundColor = [UIColor lightGrayColor];
    
    _lable.textColor = [UIColor whiteColor];
    
    [self addSubview:_lable];
    
    
    _button = [[UIButton alloc]init];
    
    _button.frame = CGRectMake(self.frame.size.width-60, self.frame.size.height-35, 30, 30);
    
    
    [_button setBackgroundImage:[UIImage imageNamed:@"btn_ware_comment.png"] forState:UIControlStateNormal];
    
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _button.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [_button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_button];
    
}


-(void)reloadDataWithDate:(DRTJXQModel *)model{

    self.MyModel = model;
    
   [_goodView sd_setImageWithURL:[NSURL URLWithString:model.goods_image]];

   _lable.text = [NSString stringWithFormat:@"     $ %@",model.price];

    [_button setTitle:model.comment_count forState:UIControlStateNormal];
    
    
    
}

-(void)buttonClicked{


    commentViewController *vc = [[commentViewController alloc]init];

    vc.goods_image = self.MyModel.goods_image;
    
    vc.goods_id = self.MyModel.goods_id;
    
    vc.title = @"评论";
    
    [self.myView.navigationController pushViewController:vc animated:YES];


}



@end
