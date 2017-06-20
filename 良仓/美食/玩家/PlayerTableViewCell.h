//
//  PlayerTableViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/7.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerModel.h"

@interface PlayerTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *photoView;

@property(nonatomic,strong)UILabel *nameLable;

@property(nonatomic,strong)UILabel *titleLable;

@property(nonatomic,strong)UILabel *publishLable;

@property(nonatomic,strong)UILabel *interestedLable;

@property(nonatomic,strong)UIImageView *iconImgae;

-(void)configCellWithModel:(PlayerModel *)model;

@end
