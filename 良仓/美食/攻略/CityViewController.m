//
//  CityViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "CityViewController.h"
#import "findViewController.h"

@interface CityViewController ()
{

    UIImageView *_imageView;
    
    NSArray *_urlArray;
}
@end

@implementation CityViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    self.navigationController.tabBarController.tabBar.hidden = YES;

}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden = NO;

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    [self createButtons];
    

}

-(void)createButtons{
    
    
   NSInteger a = (self.view.frame.size.width-150)/4;
    
    NSArray *array = @[@"上海",@"北京",@"广州",@"深圳",@"成都",@"杭州",@"青岛",@"重庆",@"天津",@"西安",@"厦门",@"南京",@"苏州",@"武汉"];
    
    _urlArray = @[@"740D3687814B02154E948FE29CC0E792gqam5OpxKSzYzNkmOohgcA==&cityid=2",@"740D3687814B02154E948FE29CC0E792IuxUA1D9lN2OB00GiA6QJw==&cityid=1",@"740D3687814B02154E948FE29CC0E7926pw9LHK9N3dbeOLjnVKrg==&cityid=3",@"740D3687814B02154E948FE29CC0E792ERpvHpvRjSWVfbFCGhX4zQ==&cityid=4",@"740D3687814B02154E948FE29CC0E792PGr/mLfVXOm1k1MKP85TWg==&cityid=246",@"740D3687814B02154E948FE29CC0E792PGr/mLfVXOm9JP/pf1LZvQ==&cityid=302",@"740D3687814B02154E948FE29CC0E7923NO1XmnwlxxDgN8j2bic6g==&cityid=268",@"740D3687814B02154E948FE29CC0E7923NO1XmnwlxxCHYlzyyd15w==&cityid=80",@"740D3687814B02154E948FE29CC0E7923NO1Xmnwlxz3LcDTzWY8/Q==&cityid=295",@"740D3687814B02154E948FE29CC0E7923NO1Xmnwlxx67llqyDy%2B9g==&cityid=70",@"740D3687814B02154E948FE29CC0E7923NO1XmnwlxwQutMiOd6bMQ==&cityid=100",@"740D3687814B02154E948FE29CC0E792FFk8pJEtCb9C3Z8zSY8ZBQ==&cityid=24",@"740D3687814B02154E948FE29CC0E792FFk8pJEtCb9XECbasp801w==&cityid=33",@"740D3687814B02154E948FE29CC0E792FFk8pJEtCb%2BSktFwB6aw1Q==&cityid=37"];
    
    for (int i =0; i<array.count; i++) {
        
        UIButton *button = [[UIButton alloc]init];
        
        button.frame = CGRectMake(a+(i%3)*50+(i%3*a), 130+(i/3)*20+(i/3*50), 50, 50);
        
        [button setTitle:array[i] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        button.layer.cornerRadius = 25;
        
        button.layer.borderWidth = 1.0;
        
        //button.layer.borderColor =[UIColor blackColor].CGColor;
        
        button.clipsToBounds = TRUE;//去除边界
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = 100+i;
        
        [self.view addSubview:button];
   
    }
    
}

-(void)buttonClicked:(UIButton *)button{

   
    NSString *cityName = button.titleLabel.text;
    
        
    if(self.myblock){
        
        self.myblock(cityName,_urlArray[button.tag - 100]);
    }
    
    
    NSUserDefaults *defauts = [NSUserDefaults standardUserDefaults];
    
    [defauts setObject:cityName forKey:@"city"];
    
    [defauts synchronize];

    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
