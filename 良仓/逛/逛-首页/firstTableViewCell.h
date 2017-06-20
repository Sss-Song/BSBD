//
//  firstTableViewCell.h
//  良仓
//
//  Created by 宋成博 on 15/12/31.
//  Copyright © 2015年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "tuiJianModel.h"

@interface firstTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *goodsImage;

@property(nonatomic,strong)UILabel *goodsName;

@property(nonatomic,strong)UILabel *price;

@property(nonatomic,strong)UILabel *likeLable;

-(void)configCellWithModel:(tuiJianModel *)model;

@end
