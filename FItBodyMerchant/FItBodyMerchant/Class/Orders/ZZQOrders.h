//
//  ZZQOrders.h
//  FItBodyUser
//
//  Created by ben on 17/4/24.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZQOrders : NSObject
/**主键*/
@property(nonatomic, copy)NSString * objId;
/**用户id*/
@property(nonatomic, copy)NSString * userId;
/**订单生成随机编号*/
@property(nonatomic, copy)NSString * orderUniqeNum;
/**评价*/
@property(nonatomic, copy)NSString * evaluateStr;
/**打分*/
@property(nonatomic, copy)NSString * stars;
/**订单总价*/
@property(nonatomic, copy)NSString * orderPrice;
/**总的卡路里*/
@property(nonatomic, copy)NSString * orderCalorie;
//商家id
@property(nonatomic, copy)NSString * merchantId;
/**订单状态*/
@property(nonatomic, copy)NSString * orderStatus;
/**创建时间*/
@property(nonatomic, strong)NSDate * createdAt;
/**更新时间*/
@property(nonatomic, strong)NSDate * updatedAt;

- (ZZQOrders *)setOrdersForObj:(AVObject *)obj;

@end
