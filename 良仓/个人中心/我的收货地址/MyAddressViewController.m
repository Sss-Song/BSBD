//
//  MyAddressViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/12.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "MyAddressViewController.h"

#import "addViewController.h"

@interface MyAddressViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;

    UITableView *_tableView;
    
    
}
@end

@implementation MyAddressViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor  blackColor];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [button setBackgroundImage:[UIImage imageNamed:@"add1.png"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(addButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = item;
    
    
    [self createTableView];
    
    [self createDataSource];
    
}

-(void)createDataSource{






}


-(void)createTableView{


    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
}


-(void)addButton{
    
    addViewController *vc =[[addViewController alloc]init];
    
    vc.title = @"新增";
    
    [self.navigationController pushViewController:vc animated:YES];
    

}


#pragma mark -- tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 200;
 
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }

    return cell;


}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
