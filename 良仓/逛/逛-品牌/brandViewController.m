//
//  brandViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/19.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "brandViewController.h"
#import "brandTableViewCell.h"

@interface brandViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray *_dataArray;
    
    UITableView *_tableView;

}
@end

@implementation brandViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self createTableView];
    
    [self createDataSource];
}

-(void)createDataSource{

}

-(void)createTableView{

    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
}

#pragma mark -- tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    brandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[brandTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }

    return cell;

}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
   
}


@end
