//
//  ZZQOrders.m
//  FItBodyUser
//
//  Created by ben on 17/4/24.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQOrders.h"

@implementation ZZQOrders

- (ZZQOrders *)setOrdersForObj:(AVObject *)obj{
    ZZQOrders * order = [[ZZQOrders alloc] init];
    order.objId = [obj objectId];
    order.userId = [obj objectForKey:@"userId"];
    order.orderUniqeNum = [obj objectForKey:@"orderUniqeNum"];
    order.orderCalorie = [obj objectForKey:@"orderCalorie"];
    order.orderPrice = [obj objectForKey:@"orderPrice"];
    order.merchantId = [obj objectForKey:@"merchantId"];
    order.orderStatus = [obj objectForKey:@"orderStatus"];
    order.createdAt = [obj objectForKey:@"createdAt"];
    order.updatedAt = [obj objectForKey:@"updatedAt"];
    order.addressId = [obj objectForKey:@"addressId"];
    return order;
}

@end
