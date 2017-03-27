//
//  ZZQBaseTabBar.h
//  FItBodyUser
//
//  Created by ben on 17/3/11.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZZQItemType) {
    ZZQItemTypeHOME = 100,//主页
    ZZQItemTypeORDER,//订单
    ZZQItemTypeME, //我的
};

@class ZZQBaseTabBar ;

typedef void(^TabBlock)(ZZQBaseTabBar * tabBar, ZZQItemType idx);

@protocol ZZQTabBarDelegate <NSObject>

- (void)zzqTabBar:(ZZQBaseTabBar *)tabBar clickButton:(ZZQItemType)idx;

@end

@interface ZZQBaseTabBar : UIView

@property(nonatomic, weak)id<ZZQTabBarDelegate> delegate;

@property(nonatomic, copy)TabBlock block;

@end
