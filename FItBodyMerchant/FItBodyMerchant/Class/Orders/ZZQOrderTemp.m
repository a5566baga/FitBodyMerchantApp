//
//  ZZQOrderTemp.m
//  FItBodyUser
//
//  Created by ben on 17/4/24.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQOrderTemp.h"

@implementation ZZQOrderTemp

- (ZZQOrderTemp *)setOrderTempForObj:(AVObject *)obj{
    ZZQOrderTemp * temp = [[ZZQOrderTemp alloc] init];
    temp.objectId = [obj objectForKey:@"objectId"];
    temp.menuPrice = [obj objectForKey:@"menuPrice"];
    temp.userID = [obj objectForKey:@"userID"];
    temp.menuSinglePrice = [obj objectForKey:@"menuSinglePrice"];
    temp.ordersID = [obj objectForKey:@"ordersID"];
    temp.menuNum = [obj objectForKey:@"menuNum"];
    temp.menuName = [obj objectForKey:@"menuName"];
    temp.menuID = [obj objectForKey:@"menuID"];
    temp.calorieSum = [obj objectForKey:@"calorieSum"];
    temp.calorieSingle = [obj objectForKey:@"calorieSingle"];
    return temp;
}

@end
