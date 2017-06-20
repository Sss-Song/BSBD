//
//  MySubView.m
//  良仓
//
//  Created by 宋成博 on 16/1/8.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "MySubView.h"


@implementation MySubView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self createSubViews];
        
    }
    return self;

}

-(void)createSubViews{

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
    
    imageView.image = [UIImage imageNamed:@"guide.jpg"];
    
    // brand_bg.png
    
    [self addSubview:imageView];
    
    
    
    _photoView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-30, 70, 60, 60)];
    
    _photoView.layer.cornerRadius = 30;
    
    _photoView.layer.masksToBounds = YES;
    
    _photoView.backgroundColor = [UIColor lightGrayColor];
    
    _photoView.userInteractionEnabled = YES;
    
    [self addSubview:_photoView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goIntoPhotoLibrary)];
    
    [_photoView addGestureRecognizer:tap];
    
    
//    UILabel *guanzhuLable = [[UILabel alloc]initWithFrame:CGRectMake(120, 100, 30, 20)];
//    
//    guanzhuLable.text = @"0";
//    
//    guanzhuLable.textColor = [UIColor blackColor];
//    
//    guanzhuLable.font = [UIFont systemFontOfSize:15];
//    
//    guanzhuLable.textAlignment =NSTextAlignmentCenter;
//    
//    [self addSubview:guanzhuLable];
//    
//    UILabel *gLable = [[UILabel alloc]initWithFrame:CGRectMake(120, 120, 30, 20)];
//    
//    gLable.text = @"关注";
//    
//    gLable.font = [UIFont systemFontOfSize:13];
//    gLable.textColor = [UIColor grayColor];
//    gLable.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:gLable];
//    
//    
//    UILabel *fensiLable = [[UILabel alloc]initWithFrame:CGRectMake(200, 100, 30, 20)];
//    fensiLable.text = @"0";
//    fensiLable.textColor = [UIColor blackColor];
//    fensiLable.font = [UIFont systemFontOfSize:15];
//    fensiLable.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:fensiLable];
//    
//    UILabel *fLable = [[UILabel alloc]initWithFrame:CGRectMake(200, 120, 30, 20)];
//    fLable.text = @"粉丝";
//    fLable.textColor = [UIColor grayColor];
//    fLable.font = [UIFont systemFontOfSize:13];
//    fLable.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:fLable];
    
    
    _nameLable = [[UILabel alloc]initWithFrame:CGRectMake(38, 145, self.frame.size.width, 20)];
    
    _nameLable.text = @"   ";
    
    _nameLable.textColor = [UIColor blackColor];
    
    _nameLable.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:_nameLable];
    
    
}

-(void)goIntoPhotoLibrary{


        
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"isLogin"]boolValue]) {
        
       
        _picker = [[UIImagePickerController alloc]init];
        
        //是否允许编辑
        _picker.allowsEditing = NO;
        
        //设置代理
        
        _picker.delegate = self;
        
        //把相册present出来
        
        [self.MyView presentViewController:_picker animated:YES completion:nil];
       
    }
    
    else{
    
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请先登录" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        alertView.alertViewStyle = UIAlertViewStyleDefault;
        
        //显示当窗口上
        [alertView show];

    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //判断一下 照片是从相机照的还是相册选的
    
    if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        //从相册取的
        
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        _photoView.image = image;
        
    }else if (picker.sourceType == UIImagePickerControllerSourceTypeCamera){
        //从相机照的
        
        UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        
        _photoView.image = image;
    }
    
    
    NSLog(@"照片取完了");
    
    //把相册dismis掉
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

@end
