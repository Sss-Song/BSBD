//
//  xiangQingViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/4.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "xiangQingViewController.h"
#import "AFNetworking.h"


@interface xiangQingViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray *_dataArray;

    UITableView *_tableView;
    
}
@end

@implementation xiangQingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self createDataSource];
    
    [self createTableView];
    
}

-(void)createDataSource{

    
    

}

-(void)createTableView{




}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    
    
    
   
}

@end
