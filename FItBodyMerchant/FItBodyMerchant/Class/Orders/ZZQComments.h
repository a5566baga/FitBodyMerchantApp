//
//  ZZQComments.h
//  FItBodyUser
//
//  Created by ben on 17/4/10.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZQComments : NSObject

//商家回复
@property(nonatomic, copy)NSString * storeReturn;
//评价星星数量
@property(nonatomic, copy)NSString * startNum;
//用户头像
@property(nonatomic, strong)NSData * portrait;
//店铺名称
@property(nonatomic, copy)NSString * storeName;
//用户名
@property(nonatomic, copy)NSString * userName;
//用户评论
@property(nonatomic, copy)NSString * userComment;
//菜品的objID
@property(nonatomic, copy)NSString * menuObjId;
//评论时间
@property(nonatomic, strong)NSDate * createDate;
//商家回复时间
@property(nonatomic, strong)NSDate * updateDate;
@property(nonatomic, copy)NSString * menuNames;

- (ZZQComments *)setCommentWithObj:(AVObject *)obj;

@end
