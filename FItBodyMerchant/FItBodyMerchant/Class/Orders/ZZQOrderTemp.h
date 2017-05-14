//
//  ZZQOrderTemp.h
//  FItBodyUser
//
//  Created by ben on 17/4/24.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZQOrderTemp : NSObject

//中间表id
@property(nonatomic, copy)NSString * objectId;
//菜品的数量
@property(nonatomic, copy)NSString * menuNum;
//总订单id
@property(nonatomic, copy)NSString * ordersID;
//菜品的单价
@property(nonatomic, copy)NSString * menuSinglePrice;
//用户ID
@property(nonatomic, copy)NSString * userID;
//菜品总价
@property(nonatomic, copy)NSString * menuPrice;
//菜品名称
@property(nonatomic, copy)NSString * menuName;
//菜品的ID
@property(nonatomic, copy)NSString * menuID;
//卡路里总数
@property(nonatomic, copy)NSString * calorieSum;
//卡路里单个数量
@property(nonatomic, copy)NSString * calorieSingle;

- (ZZQOrderTemp *)setOrderTempForObj:(AVObject *)obj;

@end
