//
//  followTableViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/14.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "followModel.h"

@interface followTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *userView;

@property(nonatomic,strong)UILabel *nameLable;

@property(nonatomic,strong)UILabel *descLable;

-(void)configCellWithModel:(followModel *)model;
@end
