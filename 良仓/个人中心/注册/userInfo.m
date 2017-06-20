//
//  userInfo.m
//  良仓
//
//  Created by 宋成博 on 16/1/15.
//  Copyright © 2016年 宋成博. All rights reserved.
//

#import "userInfo.h"

@implementation userInfo

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _userName = [aDecoder decodeObjectForKey:@"userName"];
        
        _password = [aDecoder decodeObjectForKey:@"password"];
        
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_userName forKey:@"userName"];
    
    [aCoder encodeObject:_password forKey:@"password"];
    
}

@end
