//
//  ZZQMenu.m
//  FItBodyUser
//
//  Created by ben on 17/4/4.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQMenu.h"

@implementation ZZQMenu

- (ZZQMenu *)getMenuWithObject:(AVObject *)obj{
    ZZQMenu * menu = [[ZZQMenu alloc] init];
    menu.name = [obj objectForKey:@"name"];
    menu.calorie = [obj objectForKey:@"calorie"];
    menu.price = [obj objectForKey:@"price"];
    menu.portrait = [[obj objectForKey:@"portrait"] getData];
    menu.left = [obj objectForKey:@"left"];
    menu.orderedNum = [obj objectForKey:@"orderedNum"];
    menu.type = [obj objectForKey:@"type"];
    menu.context = [obj objectForKey:@"context"];
    menu.favNum = [obj objectForKey:@"favouriteNum"];
    menu.menuID = [obj objectId];
    menu.owner = [obj objectForKey:@"owner"];
    menu.merchantID = [obj objectForKey:@"merchantID"];
    return menu;
}

@end
