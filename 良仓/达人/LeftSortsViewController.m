//
//  LeftSortsViewController.m
//  良仓
//
//  Created by 宋成博 on 16/1/6.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "personViewController.h"
#import "AppDelegate.h"

@interface LeftSortsViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *_tableView;

}
@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    imageView.image = [UIImage imageNamed:@"daren.png"];
    
    [self.view addSubview:imageView];
    
    
    [self createTbaleView];
    
    
    
}

-(void)createTbaleView{

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];

    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_tableView];
    

}

#pragma mark - tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

   
    return 40;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];

    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"默认推荐";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"最多推荐";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"最受欢迎";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"最新加入";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"最新推荐";
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
   
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        
        self.myblock(@"");
    }
    if (indexPath.row==1) {
        
        self.myblock(@"goods_sum");
    }
    if(indexPath.row == 2){
         
        self.myblock(@"followers");
    }
    if (indexPath.row==3) {
        
        self.myblock(@"reg_time");
    }
    if (indexPath.row==4) {
        
        self.myblock(@"action_time");
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [tempAppDelegate.LeftSlideVC closeLeftView];
    
}


#pragma mark - tableViewHeader

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.bounds.size.width, 100)];
    view.backgroundColor = [UIColor clearColor];
    
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
