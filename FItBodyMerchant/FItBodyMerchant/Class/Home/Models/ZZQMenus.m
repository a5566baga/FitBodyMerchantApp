//
//  ZZQMenus.m
//  FItBodyMerchant
//
//  Created by ben on 17/4/2.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQMenus.h"

@implementation ZZQMenus
- (ZZQMenus *)getMenuWithObject:(AVObject *)obj{
    ZZQMenus * menu = [[ZZQMenus alloc] init];
    menu.name = [obj objectForKey:@"name"];
    menu.calorie = [obj objectForKey:@"calorie"];
    menu.price = [obj objectForKey:@"price"];
    menu.portrait = [[obj objectForKey:@"portrait"] getData];
    menu.left = [obj objectForKey:@"left"];
    menu.orderedNum = [obj objectForKey:@"orderedNum"];
    menu.type = [obj objectForKey:@"type"];
    menu.context = [obj objectForKey:@"context"];
    menu.favNum = [obj objectForKey:@"favouriteNum"];
    menu.menuID = [obj objectForKey:@"objectId"];
    menu.owner = [[obj objectForKey:@"owner"] objectId];
    menu.merchantID = [obj objectForKey:@"merchantID"];
    NSDate * date = [obj objectForKey:@"createdAt"];
    NSDateFormatter * fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    menu.createTime = [fmt stringFromDate:date];
    return menu;
}
@end
