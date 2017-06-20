//
//  BaseXiangQingTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/8.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "BaseXiangQingTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@implementation BaseXiangQingTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
        self.backgroundColor =[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        
    }

    return self;

}

-(void)createUI{

    CGFloat xSpace = [UIScreen mainScreen].bounds.size.width;
    
    
    UILabel *pinPailable = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 40, 20)];
    
    pinPailable.text = @"品牌:";
    
    pinPailable.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:pinPailable];
    
    

    _ownerImage = [[UIImageView alloc]initWithFrame:CGRectMake(70, 20, 40, 40)];
    
    _ownerImage.layer.cornerRadius = 20;
    
    _ownerImage.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_ownerImage];
    
    
    
    _ownerLable = [[UILabel alloc]initWithFrame:CGRectMake(120, 30,xSpace-120 , 20)];
    
    _ownerLable.font = [UIFont systemFontOfSize:13];
    
    _ownerLable.numberOfLines = 0;
    
    [self.contentView addSubview:_ownerLable];

    
    
    _nameLable =[[UILabel alloc]initWithFrame:CGRectMake(20, 70, xSpace-100, 40)];
    
    _nameLable.numberOfLines = 0;
    
    _nameLable.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_nameLable];
    
    
    _priceLable = [[UILabel alloc]initWithFrame:CGRectMake(xSpace-100, 110, 100, 30)];
    
    _priceLable.font = [UIFont systemFontOfSize:15];
    
    _priceLable.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:_priceLable];
    
    
//    UIImageView *XimageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 115, 20, 20)];
//    
//    XimageView.image = [UIImage imageNamed:@"btn_cell_favorite4.png"];
//    
//    [self.contentView addSubview:XimageView];
    
    
    UILabel *XLlable = [[UILabel alloc]initWithFrame:CGRectMake(20, 115, 35, 20)];
    
    XLlable.text = @"销量:";
    
    XLlable.font = [UIFont systemFontOfSize:14];
    
    XLlable.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:XLlable];
    
    
    
    _likeLable = [[UILabel alloc]initWithFrame:CGRectMake(60, 110, 100, 30)];
    
    _likeLable.textColor = [UIColor redColor];
    
    _likeLable.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:_likeLable];
    
   
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, xSpace-40, 20)];
    lable.text = @"商品描述";
    lable.textColor =[UIColor blackColor];
    lable.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:lable];
    
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 145, xSpace-40, 0.5)];
    lable2.backgroundColor = [UIColor grayColor];
    
    [self.contentView addSubview:lable2];
    
    _descLable = [[UILabel alloc]init];
    _descLable.textColor = [UIColor blackColor];
    _descLable.numberOfLines = 0;
    _descLable.font =[UIFont systemFontOfSize:13];
    [self.contentView addSubview:_descLable];
    
    _tuijianLable = [[UILabel alloc]init];
    _tuijianLable.text = @"推荐自";
    _tuijianLable.textColor = [UIColor blackColor];
    _tuijianLable.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_tuijianLable];
    
    _LCimageView = [[UIImageView alloc]init];
    
    _LCimageView.image = [UIImage imageNamed:@"icon-60.png"];
    
    _LCimageView.layer.cornerRadius = 20;
    
    _LCimageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_LCimageView];
    
    _jingxuanLable = [[UILabel alloc]init];
    
    _jingxuanLable.text = @"良仓精选";
    
    _jingxuanLable.textColor = [UIColor blackColor];
    
    _jingxuanLable.font = [UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:_jingxuanLable];
    
    _xian2Lable = [[UILabel alloc]init];
    
    _xian2Lable.backgroundColor = [UIColor grayColor];
    
    [self.contentView addSubview:_xian2Lable];
    
    _reasonLable = [[UILabel alloc]init];
    
    _reasonLable.textColor = [UIColor blackColor];
    
    _reasonLable.numberOfLines = 0;
    
    _reasonLable.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_reasonLable];
    
    
    _xian3Lable = [[UILabel alloc]init];
    
    _xian3Lable.backgroundColor = [UIColor grayColor];
    
    [self.contentView addSubview:_xian3Lable];
    
    
    _jinRuLable = [[UILabel alloc]init];
    
    _jinRuLable.textColor = [UIColor blackColor];
    
    _jinRuLable.font =[UIFont systemFontOfSize:14];
    
    _jinRuLable.text = @"进入店铺";
    
    [self.contentView addSubview:_jinRuLable];
    

    
    _dianPuButton = [[UIButton alloc]init];
    
    _dianPuButton.layer.cornerRadius = 20;
    
    _dianPuButton.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_dianPuButton];
    
    
    _dianPuLable = [[UILabel alloc]init];
    
    _dianPuLable.textColor = [UIColor blackColor];
    
    _dianPuLable.font =[UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:_dianPuLable];
    
}

-(void)configCellWithModel:(xiangQingModel *)model{

    
    CGFloat xspace = [UIScreen mainScreen].bounds.size.width;
    
    [_ownerImage sd_setImageWithURL:[NSURL URLWithString:model.owner_image]];
    
    _priceLable.text = [NSString stringWithFormat:@" $ %@",model.price];

    _ownerLable.text = model.owner_name;
    
    _nameLable.text = [NSString stringWithFormat:@"商品名: %@",model.goods_name]; 
    
    _likeLable.text = model.like_count;
    
    
    CGSize textSize =  [self sizeWithString:model.goods_desc font:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(xspace-40, MAXFLOAT)];
    
    _descLable.frame = CGRectMake(20, 175, textSize.width, textSize.height);
    _descLable.text = model.goods_desc;
    

    
    _tuijianLable.frame = CGRectMake(20, 175+_descLable.frame.size.height+20, 50, 20);
    _LCimageView.frame =CGRectMake(20, CGRectGetMaxY(_tuijianLable.frame)+5, 40, 40);
    _jingxuanLable.frame = CGRectMake(70, CGRectGetMaxY(_tuijianLable.frame)+15, 100, 20);
    
    _xian2Lable.frame = CGRectMake(20, CGRectGetMaxY(_descLable.frame)+15, xspace-40, 0.5);
    
    
     CGSize textSize2 =  [self sizeWithString:model.rec_reason font:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(xspace-40, MAXFLOAT)];
    _reasonLable.frame = CGRectMake(20, CGRectGetMaxY(_jingxuanLable.frame)+30, xspace-40, textSize2.height);
    
    _reasonLable.text = model.rec_reason;
    
    _xian3Lable.frame = CGRectMake(20, CGRectGetMaxY(_reasonLable.frame)+15, xspace-40, 0.5);
    

    _jinRuLable.frame = CGRectMake(20, CGRectGetMaxY(_reasonLable.frame)+20, 100, 20);
    
    _dianPuButton.frame =CGRectMake(20, CGRectGetMaxY(_jinRuLable.frame)+15, 40, 40);
    [_dianPuButton sd_setBackgroundImageWithURL:[NSURL URLWithString:model.owner_image] forState:UIControlStateNormal];
   
    _dianPuLable.frame =CGRectMake(70, CGRectGetMaxY(_jinRuLable.frame)+25,xspace-70, 20);
    
    _dianPuLable.text = model.owner_name;
    
    
}


- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
 {
         NSDictionary *dict = @{NSFontAttributeName : font};
         // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
         // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
         CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
         return size;
     }

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
