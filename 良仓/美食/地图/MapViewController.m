//
//  MapViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/12.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "MapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

@interface MapViewController ()<MAMapViewDelegate,AMapSearchDelegate>
{
    
    MAMapView *_mapView;       //创建地图
    
    AMapSearchAPI *_search;    //创建搜索器
    
    CGFloat a;
    
    CGFloat b;
    
    MAPointAnnotation *_point;
    
    NSMutableArray *_pointsArray;   //创建一个数组存放大头针

}
@end

@implementation MapViewController


-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = YES;
    
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = NO;
    
    //页面将要消失的时候移除所有的大头针
    [_mapView removeAnnotations:_pointsArray];

}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _pointsArray = [[NSMutableArray alloc]init];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    [MAMapServices sharedServices].apiKey =@"65d4c16c96f07260b7e3b9104633904e";
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.delegate = self;
    
    //卫星地图和标准地图切换
    UISwitch *sw = [[UISwitch alloc]initWithFrame:CGRectMake(300, 600, 60, 35)];
    sw.tintColor = [UIColor grayColor];    
    [sw addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    [_mapView addSubview:sw];
    
    
    [self.view addSubview:_mapView];
    
    [AMapSearchServices sharedServices].apiKey = @"65d4c16c96f07260b7e3b9104633904e";
    
    
    
    [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(self.a , self.b)];
    
    [_mapView setZoomLevel:17 animated:YES];
    
    
    
    
    _mapView.showsScale= YES;  //设置成NO表示不显示比例尺；YES表示显示比例尺
    
    _mapView.scaleOrigin= CGPointMake(20,80 );  //设置比例尺位置

    _mapView.showsCompass = YES;
    _mapView.compassOrigin= CGPointMake(self.view.frame.size.width-50, 80); //设置指南针位置

    
    
    _search = [[AMapSearchAPI alloc] init];
    _search.delegate = self;
    _addressArray = [[NSMutableArray alloc]init];
    
    AMapPOIAroundSearchRequest *request = [[AMapPOIAroundSearchRequest alloc] init];
    request.location = [AMapGeoPoint locationWithLatitude:self.a  longitude:self.b];
    
    //defaults接受值
     NSString *backCity = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    
    request.keywords = backCity;
    
    // types属性表示限定搜索POI的类别，默认为：餐饮服务|商务住宅|生活服务
    // POI的类型共分为20种大类别，分别为：
    // 汽车服务|汽车销售|汽车维修|摩托车服务|餐饮服务|购物服务|生活服务|体育休闲服务|
    // 医疗保健服务|住宿服务|风景名胜|商务住宅|政府机构及社会团体|科教文化服务|
    // 交通设施服务|金融保险服务|公司企业|道路附属设施|地名地址信息|公共设施
    request.types = @"餐饮服务|生活服务|购物服务|名胜风景";
    request.sortrule = 0;
    request.requireExtension = YES;
    
    //发起周边搜索
    [_search AMapPOIAroundSearch: request];
    
}

//卫星地图和正常地图的切换
-(void)valueChange:(UISwitch *)sw{


    if (sw.on) {
    
        _mapView.mapType = MAMapTypeSatellite;
        
    }
    else{
    
        _mapView.mapType = MAMapTypeStandard;
        
    }


}


//设置大头针的属性的回校函数
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        return annotationView;
    }
    return nil;
}



//周边搜索的回调函数
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if(response.pois.count == 0)
    {
        return;
    }
    
    //通过 AMapPOISearchResponse 对象处理搜索结果
    
    for (AMapPOI *p in response.pois) {
        
        [_addressArray addObject:p];
}
    

    
    
    //通过循环 创建美食大头针
    for (AMapPOI *p in self.addressArray) {
        
        MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
        
        pointAnnotation.coordinate = CLLocationCoordinate2DMake( p.location. latitude,p.location.longitude );
        
        pointAnnotation.title = p.name;
        
        pointAnnotation.subtitle = p.address;
        
        [_pointsArray addObject:pointAnnotation];
        
        [_mapView addAnnotations:_pointsArray];
        
    }

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
