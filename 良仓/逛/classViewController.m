//
//  classViewController.m
//  良仓
//
//  Created by 宋成博 on 15/12/30.
//  Copyright © 2015年 宋成博. All rights reserved.
//

#import "classViewController.h"
#import "classZhanViewController.h"

@interface classViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *_tableView;

    NSMutableArray *_dataArray;
    
}
@end

@implementation classViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createTableView];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    NSArray *array1 = @[@"儿童用品",@"家具",@"家居配饰",@"厨卫用品"];
    
    NSArray *array2 = @[@"男士",@"女士",@"儿童"];
    
    NSArray *array3 = @[@"工具",@"玩具",@"出版",@"数码",@"户外用品",@"美容护肤"];
    
    NSArray *array4 = @[@"绘画",@"摄影",@"雕塑"];
    
    NSArray *array5 = @[@"送他",@"送她",@"送儿童"];
    
    [_dataArray addObject:array1];
    
    [_dataArray addObject:array2];
    
    [_dataArray addObject:array3];
    
    [_dataArray addObject:array4];
    
    [_dataArray addObject:array5];
    
}

-(void)createTableView{

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    
    UIView *subView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 140)];
    
    subView.backgroundColor =[UIColor whiteColor];
    
    _tableView.tableFooterView = subView;

}


#pragma mark - tableViewHeader

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 150;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ID"];
    if (view==nil) {
        
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 150)];
    }
    
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 150)];
    
    button.tag = 100+section;
    
    if (section==0) {
        [button setBackgroundImage:[UIImage imageNamed:@"class0.png"] forState:UIControlStateNormal];
    }
    if (section==1) {
        [button setBackgroundImage:[UIImage imageNamed:@"class1.png"] forState:UIControlStateNormal];
    }
    if (section==2) {
        [button setBackgroundImage:[UIImage imageNamed:@"class3.png"] forState:UIControlStateNormal];
    }
    if (section==3) {
        [button setBackgroundImage:[UIImage imageNamed:@"class4.png"] forState:UIControlStateNormal];
    }
    if (section==4) {
        
        [button setBackgroundImage:[UIImage imageNamed:@"class2.png"] forState:UIControlStateNormal];
        
    }
    [view addSubview:button];

    return view;
}


#pragma mark - tableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 5;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *array = _dataArray[section];
    
    return array.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    NSArray *array = [_dataArray objectAtIndex:indexPath.section];
    
    cell.textLabel.text = array[indexPath.row];
    
    cell.textLabel.textColor = [UIColor blackColor];
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger a = indexPath.section;
    
    NSInteger b = indexPath.row;
    
    classZhanViewController *vc = [[classZhanViewController alloc]init];
    
    if (a==0&&b==0) {
       
        vc.catCode = @"00020015";
        
        vc.title = @"儿童用品";
    }
    if (a==0&&b==1) {
        
        vc.catCode = @"00020012";
        
        vc.title = @"家具";
    }
    if (a==0&&b==2) {
        vc.catCode = @"00020013";
        
        vc.title = @"家居配饰";
    }
    if (a==0&&b==3) {
        
        vc.catCode = @"00020014";
        
        vc.title = @"厨卫用品";
    }
    if (a==1&&b==0) {
        
        vc.catCode = @"00010009";
        
        vc.title = @"男士";
    }
    if (a==1&&b==1) {
        
        vc.catCode = @"00010010";
        
        vc.title = @"女士";
    }
    if (a==1&&b==2) {
        
        vc.catCode = @"00010027";
        
        vc.title = @"儿童";
    }
    if (a==2&&b==0) {
        
        vc.catCode = @"00040019";
        
        vc.title = @"工具";
    }
    if (a==2&&b==1) {
        
        vc.catCode = @"00040020";
        
        vc.title = @"玩具";
    }
    if (a==2&&b==2) {
        
        vc.catCode = @"00040021";
        
        vc.title = @"出版";
    }
    if (a==2&&b==3) {
        
        vc.catCode = @"00040022";
        
        vc.title = @"数码";
    }
    if (a==2&&b==4) {
        
        vc.catCode  = @"00040023";
        
        vc.title = @"户外用品";
        
    }
    if (a==2&&b==5) {
        
        vc.catCode = @"00040024";
        
        vc.title = @"美容护肤";
    }
    if (a==3&&b==0) {
        
        vc.catCode = @"00030016";
        
        vc.title = @"绘画";
    }
    if (a==3&&b==1) {
        
        vc.catCode = @"00030017";
        
        vc.title = @"摄影";
    }
    if (a==3&&b==2) {
        
        vc.catCode = @"00030018";
        
        vc.title = @"雕塑";
    }
    if (a==4&&b==0) {
        
        vc.catCode = @"00050006";
        
        vc.title = @"送他";
    }
    if (a==4&&b==1) {
        
        vc.catCode = @"00050007";
        
        vc.title = @"送她";
    }
    if (a==4&&b==2) {
        
        vc.catCode = @"00050008";
        
        vc.title = @"送儿童";
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
   
}

@end
