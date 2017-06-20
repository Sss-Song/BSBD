//
//  FMDBManager.h
//  良仓
//
//  Created by 宋成博 on 16/1/11.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@interface FMDBManager : NSObject
{

    FMDatabase *_dataBase;

}

+(instancetype)shareInstance;



@end
