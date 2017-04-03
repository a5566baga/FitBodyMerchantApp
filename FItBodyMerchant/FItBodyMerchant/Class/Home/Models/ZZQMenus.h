//
//  ZZQMenus.h
//  FItBodyMerchant
//
//  Created by ben on 17/4/2.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZQMenus : NSObject

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


@end
