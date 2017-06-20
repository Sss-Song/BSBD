//
//  BaseXiangQingTableViewCell.h
//  良仓
//
//  Created by 宋成博 on 16/1/8.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "xiangQingModel.h"

@interface BaseXiangQingTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *priceLable;

@property(nonatomic,strong)UILabel *likeLable;

@property(nonatomic,strong)UILabel *ownerLable;

@property(nonatomic,strong)UILabel *nameLable;

@property(nonatomic,strong)UILabel *reasonLable;

@property(nonatomic,strong)UILabel *descLable;

@property(nonatomic,strong)UIImageView *ownerImage;

@property(nonatomic,strong)UILabel *tuijianLable;

@property(nonatomic,strong)UIImageView *LCimageView;

@property(nonatomic,strong)UILabel *jingxuanLable;

@property(nonatomic,strong)UILabel *xian2Lable;

@property(nonatomic,strong)UILabel *xian3Lable;

@property(nonatomic,strong)UILabel *jinRuLable;

@property(nonatomic,strong)UILabel *dianPuLable;

@property(nonatomic,strong)UIImageView *dianPuImage;

@property(nonatomic,strong)UIButton *dianPuButton;

-(void)configCellWithModel:(xiangQingModel *)model;

@end
