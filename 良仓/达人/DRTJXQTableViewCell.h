//
//  DRTJXQTableViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/13.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRTJXQModel.h"

@interface DRTJXQTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *tuijianLable;

@property(nonatomic,strong)UILabel *tuijianLablee;

@property(nonatomic,strong)UILabel *goods_nameLable;

@property(nonatomic,strong)UILabel *goods_descLable;

@property(nonatomic,strong)UILabel *owner_name;

@property(nonatomic,strong)UILabel *owner_desc;

@property(nonatomic,strong)UIImageView *owner_image;

@property(nonatomic,strong)UILabel *xianLable;

-(void)configCellWithModel:(DRTJXQModel *)model;

@property(nonatomic,strong)UIViewController *myView;

@end
