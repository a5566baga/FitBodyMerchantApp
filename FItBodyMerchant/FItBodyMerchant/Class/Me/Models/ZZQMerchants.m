//
//  ZZQMerchant.m
//  FItBodyUser
//
//  Created by ben on 17/4/6.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQMerchants.h"

@implementation ZZQMerchants

- (ZZQMerchants *)setMerchantDetail:(AVObject *)obj{
    ZZQMerchants * merchant = [[ZZQMerchants alloc] init];
    merchant.name = [obj objectForKey:@"name"];
    merchant.firstPic = [[obj objectForKey:@"showPic_01"] getData];
    merchant.secendPic = [[obj objectForKey:@"showPic_02"] getData];
    merchant.thirdPic = [[obj objectForKey:@"showPic_03"] getData];
    merchant.fourthPic = [[obj objectForKey:@"showPic_04"] getData];
    merchant.phone = [obj objectForKey:@"phone"];
    merchant.protrait = [[obj objectForKey:@"protrait"] getData];
    merchant.location = [obj objectForKey:@"location"];
    merchant.totalOrdered = [obj objectForKey:@"totalOrdered"];
    merchant.avePrice = [obj objectForKey:@"avePrice"];
    merchant.favNum = [obj objectForKey:@"favouriteNum"];
    merchant.canMess = [obj objectForKey:@"canMess"];
    merchant.canTakeOut = [obj objectForKey:@"canTakeOut"];
    merchant.canTakeSelf = [obj objectForKey:@"canTakeSelf"];
    merchant.logoData = [[obj objectForKey:@"logo"] getData];
    merchant.broadcastMsg = [obj objectForKey:@"broadcastMsg"];
    merchant.startsNum = [obj objectForKey:@"startsNum"];
    merchant.owner = [obj objectForKey:@"owner"];
    merchant.objId = [obj objectForKey:@"objectId"];
    return merchant;
}

@end
