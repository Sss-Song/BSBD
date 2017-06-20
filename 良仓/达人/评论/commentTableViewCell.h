//
//  commentTableViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/13.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface commentTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *commentImage;

@property(nonatomic,strong)UILabel *nameLable;

@property(nonatomic,copy)UILabel *commentLable;

-(void)configCellWithModel:(CommentModel *)model;

@end
