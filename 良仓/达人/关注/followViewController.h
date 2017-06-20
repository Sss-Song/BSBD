//
//  followViewController.h
//  良仓
//
//  Created by 宋成博 on 16/1/14.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "followADView.h"

@interface followViewController : UIViewController

@property(nonatomic,copy)NSString *ifFollow;

@property(nonatomic,copy)NSString *owner_id;


@property(nonatomic,strong)followADView *ADView;

@end
