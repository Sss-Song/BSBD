//
//  DRXQADScrollView.m
//  良仓
//
//  Created by 宋成博 on 16/1/9.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "DRXQADScrollView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

#import "HeaderScrollView.h"
#import "DaRenXiangQingViewController.h"

#import "followViewController.h"

@implementation DRXQADScrollView
{
    
    UIImageView *_userView;
    
    UILabel *_nameLable;
    
    UILabel *_descLable;
    
    UIButton *_followButton;
    
    UIButton *_beFollowButton;
    
    UIButton *_FollowButton;
    
    UIButton *_BeFollowButton;

}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createSubViews];
        
        //self.backgroundColor =[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        
    }
    return self;
}

-(void)createSubViews{

  
    _userView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 100, 100)];
    
    [self addSubview:_userView];

    _nameLable = [[UILabel alloc]initWithFrame:CGRectMake(140, 20, 100, 30)];
    _nameLable.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:_nameLable];
    
    _descLable = [[UILabel alloc]initWithFrame:CGRectMake(140, 50, self.frame.size.width-150, 30)];
    
    _descLable.numberOfLines = 0;
    _descLable.font = [UIFont systemFontOfSize:12];
    
    [self addSubview:_descLable];
    
    
//    _followButton = [[UIButton alloc]initWithFrame:CGRectMake(140, 100, (self.frame.size.width-180)/2, 20)];
//    _followButton.titleLabel.font = [UIFont systemFontOfSize:13];
//    
//    [_followButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    
//    [_followButton setBackgroundImage:[UIImage imageNamed:@"btn_usecoupon.png"] forState:UIControlStateNormal];
//    
//    [_followButton addTarget:self action:@selector(followClicked) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self addSubview:_followButton];
//    
//    _beFollowButton = [[UIButton alloc]initWithFrame:CGRectMake(160+(self.frame.size.width-180)/2, 100, (self.frame.size.width-180)/2, 20)];
//    _beFollowButton.titleLabel.font = [UIFont systemFontOfSize:13];
//    
//    [_beFollowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    
//    [_beFollowButton setBackgroundImage:[UIImage imageNamed:@"btn_usecoupon.png"] forState:UIControlStateNormal];
//    
//    [_beFollowButton addTarget:self action:@selector(followedClicked) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self addSubview:_beFollowButton];
    
    //_FollowButton = [[UIButton alloc]initWithFrame:CGRectMake(130, 100, (self.frame.size.width-130-20-10)/2, 20)];
    _FollowButton =[[UIButton alloc]initWithFrame:CGRectMake(20, 85, (self.frame.size.width-60)/2, 20)];
    
    [_FollowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     _FollowButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
    _FollowButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_FollowButton addTarget:self action:@selector(followClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_FollowButton];
    
    _BeFollowButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FollowButton.frame)+20, 85,(self.frame.size.width-60)/2,20)];
    [_BeFollowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     _BeFollowButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
    _BeFollowButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_BeFollowButton addTarget:self action:@selector(followedClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_BeFollowButton];
    
    UILabel *shuLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_FollowButton.frame)+10, 87, 1, 16)];
    shuLable.backgroundColor =[UIColor blackColor];
    
    [self addSubview:shuLable];
    
    
    
    UILabel *lable = [[UILabel alloc]init];
    lable.frame = CGRectMake(10, 135, self.frame.size.width, 15);
   
    lable.text = @"推荐";
    
    lable.font = [UIFont systemFontOfSize:15];
    
    [self addSubview:lable];
    
    UILabel *xianLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, self.frame.size.width-20, 0.5)];
    xianLable.backgroundColor = [UIColor blackColor];
    
    [self addSubview:xianLable];
    
    
}

-(void)reloadWithModel:(DRXQADmodel *)model{

    
    self.myModel = model;
    
    [_userView sd_setImageWithURL:[NSURL URLWithString:model.user_image]placeholderImage:[UIImage imageNamed:@"daren.png"]];
    _nameLable.text = model.user_name;
    
    _descLable.text = [NSString stringWithFormat:@"简介:%@",model.user_desc];
    
    
    [_FollowButton setTitle:[NSString stringWithFormat:@"%@ 关注",model.following_count] forState:UIControlStateNormal];
    
    [_BeFollowButton setTitle:[NSString stringWithFormat:@"粉丝 %@",model.followed_count]forState:UIControlStateNormal];
    
    [_followButton setTitle:[NSString stringWithFormat:@"关注  %@",model.following_count] forState:UIControlStateNormal];
    
    [_beFollowButton setTitle:[NSString stringWithFormat:@"粉丝 %@",model.followed_count] forState:UIControlStateNormal];
    
    
}

-(void)followClicked{


    followViewController *vc = [[followViewController alloc]init];
    
    NSUserDefaults *defauts = [NSUserDefaults standardUserDefaults];
    
    [defauts setObject: @"全部关注" forKey:@"follow"];
    
    [defauts synchronize];
    
    vc.owner_id = self.myModel.user_id;
    
    vc.ifFollow = @"following";
    
    vc.title = @"关注";
    
    HeaderScrollView *sc = self.myView;
    
    DaRenXiangQingViewController *dr = (id)sc.myView;
    
    [dr.navigationController pushViewController:vc animated:YES];
    
}

-(void)followedClicked{

    followViewController *vc = [[followViewController alloc]init];
    
    NSUserDefaults *defauts = [NSUserDefaults standardUserDefaults];
    
    [defauts setObject: @"全部粉丝" forKey:@"follow"];
    
    [defauts synchronize];
    
    vc.owner_id = self.myModel.user_id;
    
    vc.ifFollow = @"followed";
    
    vc.title = @"粉丝";
    
    HeaderScrollView *sc = self.myView;
    
    DaRenXiangQingViewController *dr = (id)sc.myView;
    
    [dr.navigationController pushViewController:vc animated:YES];

}

@end
