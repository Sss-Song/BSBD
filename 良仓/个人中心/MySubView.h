//
//  MySubView.h
//  良仓
//
//  Created by 宋成博 on 16/1/8.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySubView : UIView <UINavigationControllerDelegate,UIImagePickerControllerDelegate>


@property(nonatomic,strong)UIImageView *photoView;

@property(nonatomic,strong)UILabel *nameLable;

@property(nonatomic,strong)UIViewController *MyView;

@property(nonatomic,strong)UIImagePickerController * picker;

@end
