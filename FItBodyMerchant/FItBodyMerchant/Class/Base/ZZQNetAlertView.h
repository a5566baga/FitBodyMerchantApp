//
//  ZZQNetAlertView.h
//  FItBodyUser
//
//  Created by ben on 17/3/12.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZQNetAlertView : UIView

/**
 * 初始化大小和提示信息
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;
/**
 * 设置动画效果
 */
- (void)setViewForAnimal;

@end
