//
//  shiYeTableViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/7.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ShiYeGGModel.h"

@interface shiYeTableViewCell : UITableViewCell


@property(nonatomic,strong)UIImageView *picUrlView;


@property(nonatomic,strong)UILabel *titleLable;

@property(nonatomic,strong)UILabel *descriptionLable;

-(void)configCellWithModel:(ShiYeGGModel *)model;

@end
