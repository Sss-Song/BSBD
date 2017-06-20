//
//  DRXQADScrollView.h
//  良仓
//
//  Created by 宋成博 on 16/1/9.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRXQADmodel.h"
@class HeaderScrollView;

@interface DRXQADScrollView : UIView

@property(nonatomic,strong)DRXQADmodel *myModel;

@property(nonatomic,retain)HeaderScrollView *myView;

-(void)reloadWithModel:(DRXQADmodel *)model;


@end
