//
//  ZZQMerchant.h
//  FItBodyMerchant
//
//  Created by ben on 17/4/2.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZQMerchant : NSObject

//店铺名称
@property(nonatomic, copy)NSString * name;
//店铺图片
@property(nonatomic, strong)NSData * protrait;
//商家手机号
@property(nonatomic, copy)NSString * phone;
//商家身份证号码
@property(nonatomic, copy)NSString * cardNum;
//商家身份证正面图片
@property(nonatomic, strong)NSData * cardFront;
//商家身份证背面图片
@property(nonatomic, strong)NSData * cardBack;
//商家银行卡号
@property(nonatomic, copy)NSString * bankCard;
//商家密码
@property(nonatomic, copy)NSString * password;
//商家邮箱
@property(nonatomic, copy)NSString * email;
//商家真实姓名
@property(nonatomic, copy)NSString * trueName;
//信息是否审核通过
@property(nonatomic, assign)bool isPassed;

@end
