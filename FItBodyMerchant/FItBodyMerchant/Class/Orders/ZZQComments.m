//
//  ZZQComments.m
//  FItBodyUser
//
//  Created by ben on 17/4/10.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQComments.h"

@implementation ZZQComments



- (ZZQComments *)setCommentWithObj:(AVObject *)obj{
    ZZQComments * comment = [[ZZQComments alloc] init];
    comment.storeReturn = [obj objectForKey:@"storeReturn"];
    comment.startNum = [obj objectForKey:@"startNum"];
    comment.portrait = [[obj objectForKey:@"userPortrait"] getData];
    comment.storeName = [obj objectForKey:@"storeName"];
    comment.userName = [obj objectForKey:@"userName"];
    comment.menuObjId = [obj objectForKey:@"menuId"];
    comment.createDate = [obj objectForKey:@"createdAt"];
    comment.updateDate = [obj objectForKey:@"updatedAt"];
    comment.userComment = [obj objectForKey:@"userComment"];
    comment.menuNames = [obj objectForKey:@"menuNames"];
    return comment;
}

@end
