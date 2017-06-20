//
//  ADScrollView.m
//  CutomCellDemo
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ADScrollView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "giftnextViewController.h"
#import "shouYeADModel.h"
#import "shouYeViewController.h"
#import "shouYeADDModel.h"

@implementation ADScrollView 
{
    UIScrollView *_scrollView;
    
    UIPageControl *_pageControl;
    
    NSMutableArray *_imageArray;
    
    NSTimer *_timer;
    
    UILabel * _oneLable;
    
    UIScrollView *_scrollView2;
    
    NSArray *_array1;
    
    NSArray *_array2;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self createSubViews];
    
    }
    return self;
}
-(void)createSubViews
{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 180)];
    
    _scrollView.delegate = self;
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    [self addSubview:_scrollView];
    
    
    _scrollView2 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 205, self.frame.size.width, 100)];
    
    _scrollView2.delegate =self;
    
    _scrollView2.pagingEnabled=YES;
    
    _scrollView2.showsHorizontalScrollIndicator = NO;
    
    [self addSubview: _scrollView2];
    
    _oneLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 185, self.frame.size.width, 15)];
    _oneLable.font = [UIFont systemFontOfSize:15];
    
    _oneLable.backgroundColor = [UIColor clearColor];
    
    _oneLable.text = @"推荐品类";
    
    [self addSubview:_oneLable];
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 140, self.frame.size.width, 40)];
    
    _pageControl.backgroundColor = [UIColor clearColor];
    
    _pageControl.alpha = 0.5;
   
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    _pageControl.currentPage = 0;
    
    [_pageControl addTarget:self action:@selector(pageIndexChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:_pageControl];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 310, self.frame.size.width, 110)];
    imageView.image = [UIImage imageNamed:@"tuijian3.png"];
    
    [self addSubview:imageView];
    
    UILabel *textLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, imageView.frame.size.width, 30)];
    
    textLable.text = @"- 热 门 商 品 -";
    
    textLable.textColor = [UIColor grayColor];
    
    textLable.font = [UIFont systemFontOfSize:18];
    
    textLable.backgroundColor =[UIColor clearColor];
    
    textLable.textAlignment = NSTextAlignmentCenter;
    
    [imageView addSubview:textLable];
    
    
    UILabel *twoLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 425, self.frame.size.width, 15)];
    
    twoLable.text = @"热门商品";
    
    twoLable.backgroundColor =[UIColor clearColor];
    
    twoLable.font = [UIFont systemFontOfSize:15];
    
    [self addSubview:twoLable];
    
    
}


-(void)reloadDataWithImageArray:(NSArray *)array
{
    
    _array1 = [NSArray arrayWithArray:array];
    
    for (UIView * subView in _scrollView.subviews)
    {
        
        [subView removeFromSuperview];
    }
    for (int i=0; i<array.count; i++) {
        
        UIButton *button = [[UIButton alloc]init];
        
        button.frame = CGRectMake(i * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        shouYeADModel *model = array[i];
        
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.pic_url] forState:UIControlStateNormal];
        
        button.tag = 200+i;
        
        [button addTarget:self action:@selector(ADButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_scrollView addSubview:button];
        
        
    }
    
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * array.count, _scrollView.frame.size.height);
    
    _pageControl.currentPage = 0;
    
    
    _pageControl.numberOfPages = array.count;
    
    if (_imageArray == nil) {
        
        _imageArray = [[NSMutableArray alloc]init];
    }
    [_imageArray removeAllObjects];
   
    [_imageArray addObjectsFromArray:array];
    if(_imageArray.count >=2)
    {
        if (_timer==nil)
        {
            [self startTimer];
        }
    }
}

-(void)reloadDataWithImageArray2:(NSArray *)array2{
    
    
    _array2 = [NSArray arrayWithArray:array2];
    
    for (UIView * subView in _scrollView2.subviews)
    {
        //移除所有的子视图
        [subView removeFromSuperview];
    }
    
    
    for (int i= 0 ; i<array2.count;i++) {
        
        UIButton *button = [[UIButton alloc]init];
        
        button.frame =CGRectMake((i*100)+10*i, 0, 100, 100);
        
        button.layer.cornerRadius = 8;
        
        button.layer.masksToBounds = YES;
        
        shouYeADDModel *model = array2[i];
        
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.pic_url] forState:UIControlStateNormal];
        
        //[button sd_setBackgroundImageWithURL:[NSURL URLWithString:array2[i]] forState:UIControlStateNormal];
        
        button.tag = 100+i;
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_scrollView2 addSubview:button];
        
 }
    _scrollView2.contentSize = CGSizeMake(100 * array2.count+10*array2.count, _scrollView2.frame.size.height);
}

-(void)ADButtonClicked:(UIButton *)button{

giftnextViewController *vc = [[giftnextViewController alloc]init];

    shouYeViewController *webVC = [[shouYeViewController alloc]init];
    if (button.tag==200) {
        
        shouYeADModel *model = _array1[button.tag-200];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            
            
            vc.list_ID =[ model.content_id integerValue];
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
        
        
    }
    if (button.tag==201) {
        
        
        shouYeADModel *model = _array1[button.tag-200];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            vc.list_ID = [model.content_id integerValue];
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            webVC.title = model.topic_name;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
        
    }
    if (button.tag==202) {
        
        
        shouYeADModel *model = _array1[button.tag-200];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            vc.list_ID = 50;
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            webVC.title = model.topic_name;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
    }
    
   
    
}



-(void)buttonClicked:(UIButton *)button{

    
    giftnextViewController *vc = [[giftnextViewController alloc]init];

    if (button.tag==100) {
        
        shouYeADDModel *model = _array2[button.tag-100];
        
        shouYeViewController *webVC = [[shouYeViewController alloc]init];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            vc.list_ID = [model.content_id integerValue];
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            webVC.title = model.topic_name;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
    }

    if (button.tag==101) {
        
        shouYeADDModel *model = _array2[button.tag-100];
        
        shouYeViewController *webVC = [[shouYeViewController alloc]init];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            vc.list_ID = [model.content_id integerValue];
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            webVC.title = model.topic_name;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
    }

    
    if (button.tag==102) {
        
        shouYeADDModel *model = _array2[button.tag-100];
        
        shouYeViewController *webVC = [[shouYeViewController alloc]init];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            vc.list_ID = [model.content_id integerValue];
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            webVC.title = model.topic_name;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
    }

    
    if (button.tag==103) {
        
        shouYeADDModel *model = _array2[button.tag-100];
        
        shouYeViewController *webVC = [[shouYeViewController alloc]init];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            vc.list_ID = [model.content_id integerValue];
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            webVC.title = model.topic_name;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
    }

    
    
    if (button.tag==104) {
        
        shouYeADDModel *model = _array2[button.tag-100];
        
        shouYeViewController *webVC = [[shouYeViewController alloc]init];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            vc.list_ID = [model.content_id integerValue];
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            webVC.title = model.topic_name;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
    }

    
    if (button.tag==105) {
        
        shouYeADDModel *model = _array2[button.tag-100];
        
        shouYeViewController *webVC = [[shouYeViewController alloc]init];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            vc.list_ID = [model.content_id integerValue];
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            webVC.title = model.topic_name;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
    }
    if (button.tag==106) {
        
        shouYeADDModel *model = _array2[button.tag-100];
        
        shouYeViewController *webVC = [[shouYeViewController alloc]init];
        
        if ([model.content_type isEqualToString:@"2"]) {
            
            vc.list_ID = [model.content_id integerValue];
            
            [self.myView.navigationController pushViewController:vc animated:YES];
        }
        else{
            
            webVC.openUrl = model.topic_url;
            
            webVC.title = model.topic_name;
            
            [self.myView.navigationController pushViewController:webVC animated:YES];
        }
    }
}
    
#pragma mark - 关于定时器
-(void)startTimer
{

    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    //NSRunLoop不断监测事件的，UI的操作不打断定时器的计时
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

-(void)stopTimer
{
    if (_timer) {
        //销毁定时器
        [_timer invalidate];
        _timer=nil;
    }
}

-(void)nextImage
{
    if (_pageControl.currentPage < _pageControl.numberOfPages -1) {
        
        _pageControl.currentPage ++;
    }else
    {
        _pageControl.currentPage = 0;
    }
    [self pageIndexChanged:_pageControl];
}


#pragma mark - 滚动结束

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    _pageControl.currentPage = index;
   
}

-(void)pageIndexChanged:(UIPageControl *)pageControl
{
    
    _scrollView.contentOffset = CGPointMake(pageControl.currentPage * _scrollView.frame.size.width, 0);
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

@end
