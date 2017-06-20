//
//  commentADView.h
//  良仓
//
//  Created by 宋成博 on 16/1/13.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface commentADView : UIView

@property(nonatomic,copy)NSString *goods_image;

-(void)reloadDataWithUrl:(NSString *)url;

@end
