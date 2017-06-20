//
//  BaseADScrollView.m
//  良仓
//
//  Created by 宋成博 on 16/1/8.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "BaseADScrollView.h"
#import "UIImageView+WebCache.h"

@implementation BaseADScrollView

{
    UIScrollView *_scrollView;
    
    UIPageControl *_pageControl;
    
    NSMutableArray *_imageArray;
    
    NSTimer *_timer;
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
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
    
    _scrollView.delegate = self;
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 140, self.frame.size.width, 40)];
    
    _pageControl.backgroundColor = [UIColor clearColor];
    
    _pageControl.alpha = 0.5;
    
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    _pageControl.currentPage = 0;
    
    [_pageControl addTarget:self action:@selector(pageIndexChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:_pageControl];

}


-(void)reloadDataWithImageArray:(NSArray *)array
{
    
    for (UIView * subView in _scrollView.subviews)
    {
        
        [subView removeFromSuperview];
    }
    for (int i=0; i<array.count; i++) {
        
        
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(i * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:array[i]]placeholderImage:nil];
        
        [_scrollView addSubview:imageView];
        
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
