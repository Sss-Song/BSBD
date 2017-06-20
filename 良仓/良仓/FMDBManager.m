//
//  FMDBManager.m
//  良仓
//
//  Created by 宋成博 on 16/1/11.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "FMDBManager.h"

@implementation FMDBManager


+(instancetype)shareInstance{

   
    static FMDBManager *manager;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        
        manager = [[FMDBManager alloc]init];
        
    });
    
    
    return manager;
 
}


-(instancetype)init{
    
    if (self = [super init]) {
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/myLimit.db"];
        
        _dataBase = [[FMDatabase alloc]initWithPath:path];
        
        [_dataBase open];
        
        
        //建表
        
        NSString *createTableSql = @"create table if not exists limit1 (id integer primary key autoincrement,appid varchar (256),iconurl varchar (256),name varchar (256)) ";
        
        if ([_dataBase executeUpdate:createTableSql]) {
            
            NSLog(@"建表成功");
            
        }
        
        
    }
    
    return self;
}


@end
