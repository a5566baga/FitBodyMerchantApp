//
//  ZZQAddress.m
//  FItBodyUser
//
//  Created by ben on 17/4/16.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQAddress.h"

@implementation ZZQAddress

- (ZZQAddress *)setModleForObject:(AVObject *)obj{
    ZZQAddress * address = [[ZZQAddress alloc] init];
    address.address = [obj objectForKey:@"address"];
    address.sex = [obj objectForKey:@"sex"];
    address.consigneePhone = [obj objectForKey:@"consigneePhone"];
    address.consigneeName = [obj objectForKey:@"consigneeName"];
    address.objId = [obj objectForKey:@"objectId"];
    return address;
}

@end
