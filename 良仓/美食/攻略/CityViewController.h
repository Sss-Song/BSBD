//
//  CityViewController.h
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CityViewController : UIViewController


@property (nonatomic,copy)void(^myblock)(NSString *text,NSString *url);

@property(nonatomic,copy)void(^cityblock)(NSString *cityName);

@end
