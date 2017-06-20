//
//  findViewController.h
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "WMPageController.h"

#import <AMapSearchKit/AMapSearchKit.h>

@interface findViewController : WMPageController

@property(nonatomic,strong)NSArray *viewControllers;

@property(nonatomic,strong)UIButton *button;

@property(nonatomic,strong)UIButton *mapButton;

@property(nonatomic,copy)NSString *cityName;

@property(nonatomic,strong)AMapGeocodeSearchRequest *goe;

@end
