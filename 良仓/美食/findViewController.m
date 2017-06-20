//
//  findViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "findViewController.h"
#import "gongViewController.h"
#import "PlayerViewController.h"
#import "shiYeViewController.h"
#import "CityViewController.h"
#import "MapViewController.h"
#import <AMapSearchKit/AMapSearchKit.h>

@interface findViewController () <AMapSearchDelegate>
{
    AMapSearchAPI *_search;
    
    CGFloat a;
    
    CGFloat b;
    
    NSMutableArray *_addressArray;
    
}

@end

@implementation findViewController

-(instancetype)init{
    
    if (self = [super init]) {
        
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI{
    
    self.menuViewStyle = WMMenuViewStyleLine;
    
    self.titleSizeNormal = 15;
    
    self.titleColorNormal =[UIColor grayColor];
    
    self.titleColorSelected = [UIColor blackColor];
    
    self.titles = @[@"攻略",@"玩家",@"视野"];
    
    self.viewControllerClasses = @[[gongViewController class],[PlayerViewController class],[shiYeViewController class]];
    
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    _addressArray = [[NSMutableArray alloc]init];
    
    [AMapSearchServices sharedServices].apiKey = @"65d4c16c96f07260b7e3b9104633904e";
    
    _search = [[AMapSearchAPI alloc] init];
    
    _search.delegate = self;
    
    _goe = [[AMapGeocodeSearchRequest alloc] init];
    
    _goe.address = @"北京";
    
    NSString *backCity = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    
    _goe.address = backCity;
    
    //发起正向地理编码
    [_search AMapGeocodeSearch: _goe];
    
    
    
}

- (void)viewDidLoad {
    
        [super viewDidLoad];

        int selectIndex = self.selectIndex;
    
    if (selectIndex==0) {
        
        _button = [[UIButton alloc]init];
        
        _button.frame = CGRectMake(0, 0, 40, 40);
        
        _button.titleLabel.font = [UIFont systemFontOfSize:16];
        
        [_button setTitle:@"北京"forState:UIControlStateNormal];
        
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:_button];
        
        [_button addTarget:self action:@selector(itemClicked) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = item;
    }
    
    _mapButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    [_mapButton setBackgroundImage:[UIImage imageNamed:@"map.png"] forState:UIControlStateNormal];
    
    _mapButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_mapButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_mapButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [_mapButton addTarget:self action:@selector(MapButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_mapButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response
{
    if(response.geocodes.count == 0)
    {
        NSLog(@"sssssssss");
    }
    
    //通过AMapGeocodeSearchResponse对象处理搜索结果
    NSString *strCount = [NSString stringWithFormat:@"count: %ld", (long)response.count];
    NSString *strGeocodes = @"";
    for (AMapTip *p in response.geocodes) {
        
        strGeocodes = [NSString stringWithFormat:@"%@\ngeocode: %@", strGeocodes, p.description];
        
        a=p.location.latitude;
        
        b=p.location.longitude;

    }
    
    NSString *result = [NSString stringWithFormat:@"%@ \n %@", strCount, strGeocodes];
    
    NSLog(@"Geocode: %@", result);
    
}

-(void)itemClicked{
    
    
    CityViewController *vc = [[CityViewController alloc]init];
    
    gongViewController *gongVC = (gongViewController *)self.currentViewController;
    
    if (gongVC) {
        
        vc.myblock = ^(NSString *text,NSString *url){
            
            [self.button setTitle:text forState:UIControlStateNormal];
            
             gongVC.url = url;

            [gongVC.dataArray removeAllObjects];
            
            [gongVC createDataSource];
            
        };
        
        [self.navigationController pushViewController:vc animated:NO];
        
    }
    
       vc.title = @"选择城市";
    
}

-(void)MapButton{

    NSString *backCity = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    
    MapViewController *vc = [[MapViewController alloc]init];
    
    vc.title = [NSString stringWithFormat:@"%@生活",backCity];
    
    vc.a = a;
    
    vc.b = b;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
