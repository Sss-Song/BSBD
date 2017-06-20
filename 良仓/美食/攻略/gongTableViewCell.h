//
//  gongTableViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gongModel.h"

@interface gongTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *iconView;

@property(nonatomic,strong)UILabel *titleLable;

@property(nonatomic,strong)UILabel *viceLable;

@property(nonatomic,strong)UILabel *categoryLable;

-(void)configCellWithModel:(gongModel *)model;

@end
