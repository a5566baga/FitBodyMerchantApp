//
//  ZZQUser.m
//  FItBodyUser
//
//  Created by ben on 17/5/3.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQUser.h"

@implementation ZZQUser

- (ZZQUser *)setUserForObj:(AVObject *)obj{
    ZZQUser * user = [[ZZQUser alloc] init];
    user.objectId = [obj objectId];
    user.age = [obj objectForKey:@"age"];
    user.sex = [obj objectForKey:@"sex"];
    user.userProtait = [[obj objectForKey:@"userProtait"] getData];
    user.type = [obj objectForKey:@"type"];
    user.userPassword = [obj objectForKey:@"userPassword"];
    user.userPhone = [obj objectForKey:@"userPhone"];
    user.owner = [obj objectForKey:@"owner"];
    user.userName = [obj objectForKey:@"userName"];
    user.calorieNeed = [obj objectForKey:@"calorieNeed"];
    user.payWay = [obj objectForKey:@"payWay"];
    user.addressId = [obj objectForKey:@"addressId"];
    return user;
}

@end
