//
//  DRTJXQADView.h
//  良仓
//
//  Created by 宋成博 on 16/1/13.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRTJXQModel.h"


@interface DRTJXQADView : UIView

-(void)reloadDataWithDate:(DRTJXQModel *)model;

@property(nonatomic,strong)UIViewController *myView;

@property(nonatomic,strong)DRTJXQModel *MyModel;



@end
