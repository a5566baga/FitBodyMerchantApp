//
//  ZZQMenu.h
//  FItBodyUser
//
//  Created by ben on 17/4/4.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZQMenu : NSObject

//菜品名称
@property(nonatomic, copy)NSString * name;
//菜品的卡路里数
@property(nonatomic, copy)NSString * calorie;
//价格
@property(nonatomic, copy)NSString * price;
//头像图片
@property(nonatomic, strong)NSData * portrait;
//剩余份数
@property(nonatomic, copy)NSString * left;
//被点过多少次
@property(nonatomic, copy)NSString * orderedNum;
//类型
@property(nonatomic, copy)NSString * type;
//简介
@property(nonatomic, copy)NSString * context;
//收藏人数
@property(nonatomic, copy)NSString * favNum;
//菜单id
@property(nonatomic, copy)NSString * menuID;
//所属店铺
@property(nonatomic, strong)AVUser * owner;
@property(nonatomic, copy)NSString * merchantID;

- (ZZQMenu *)getMenuWithObject:(AVObject *)obj;

@end
