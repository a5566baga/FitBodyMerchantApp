//
//  ZZQUser.h
//  FItBodyUser
//
//  Created by ben on 17/5/3.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZQUser : NSObject

@property(nonatomic, copy)NSString * objectId;
@property(nonatomic, copy)NSString * age;
@property(nonatomic, copy)NSString * sex;
@property(nonatomic, strong)NSData * userProtait;
@property(nonatomic, copy)NSString * type;
@property(nonatomic, copy)NSString * userPassword;
@property(nonatomic, copy)NSString * userPhone;
@property(nonatomic, copy)NSString * owner;
@property(nonatomic, copy)NSString * userName;
@property(nonatomic, copy)NSString * calorieNeed;
@property(nonatomic, copy)NSString * payWay;
@property(nonatomic, copy)NSString * addressId;

- (ZZQUser *)setUserForObj:(AVObject *)obj;

@end
