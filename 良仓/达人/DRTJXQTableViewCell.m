//
//  DRTJXQTableViewCell.m
//  良仓
//
//  Created by 宋成博 on 16/1/13.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "DRTJXQTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "linkViewController.h"



@implementation DRTJXQTableViewCell
{

    
 
  
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor =[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        
        [self createUI];
    }

 
    return self;
}

-(void)createUI{

    CGFloat xspace = [UIScreen mainScreen].bounds.size.width;
    
    
    _tuijianLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 20)];
    _tuijianLable.textColor =[UIColor blackColor];
    
    _tuijianLable.font =[UIFont systemFontOfSize:15];
    
    _tuijianLable.text = @"推荐自";
    
    [self.contentView addSubview:_tuijianLable];
    
    
    
    _owner_image =[[UIImageView alloc]initWithFrame:CGRectMake(20, 40, 50, 50)];
    
    _owner_image.layer.cornerRadius = 25;
    
    _owner_image.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_owner_image];
    
    
    _owner_name = [[UILabel alloc]initWithFrame:CGRectMake(90, 40, 100, 20)];
    _owner_name.textColor = [UIColor blackColor];
    
    _owner_name.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_owner_name];
    
    _owner_desc = [[UILabel alloc]initWithFrame:CGRectMake(90, 60, 200, 40)];
    _owner_desc.numberOfLines = 0;
    
    _owner_desc.textColor = [UIColor blackColor];
    
    _owner_desc.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_owner_desc];
    
    _xianLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, xspace-40, 0.5)];
    _xianLable.backgroundColor = [UIColor lightGrayColor];
    
    [self.contentView addSubview:_xianLable];
    
    
    _tuijianLablee = [[UILabel alloc]initWithFrame:CGRectMake(20, 110, xspace-40, 20)];
    
    _tuijianLablee.text = @"推荐品";
    
    _tuijianLablee.font = [UIFont systemFontOfSize:15];
    
    _tuijianLablee.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:_tuijianLablee];
    
    
    _goods_nameLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 130, xspace-40, 20)];
    
    _goods_nameLable.textColor = [UIColor redColor];
    
    _goods_nameLable.font =[UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_goods_nameLable];


    _goods_descLable = [[UILabel alloc]init];
    
    _goods_descLable.textColor = [UIColor blackColor];
    
    _goods_descLable.font = [UIFont systemFontOfSize:13];
    
    _goods_descLable.numberOfLines = 0;
    
    [self.contentView addSubview:_goods_descLable];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(xspace-70, 30, 40, 20)];
    
    [button setBackgroundImage:[UIImage imageNamed:@"btn_ware_buy.png"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:button];
    
    
}


-(void)configCellWithModel:(DRTJXQModel *)model{

 
    CGFloat xspace = [UIScreen mainScreen].bounds.size.width;
    
    [_owner_image sd_setImageWithURL:[NSURL URLWithString:model.owner_image]];
    
    _owner_name.text = model.owner_name;
    
    _owner_desc.text = [NSString stringWithFormat:@"简介:%@",model.owner_desc];
    
    _goods_nameLable.text = model.goods_name;
    
    
    
     CGSize textSize =  [self sizeWithString:model.goods_desc font:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(xspace-40, MAXFLOAT)];
    
    _goods_descLable.frame = CGRectMake(20, 160, xspace-40, textSize.height);
    
    _goods_descLable.text = model.goods_desc;
}

- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}




-(void)buttonClicked{


    linkViewController *vc = [[linkViewController alloc]init];
    
    [self.myView.navigationController pushViewController:vc animated:YES];
    
}



- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
@end
