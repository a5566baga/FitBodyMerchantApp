//
//  ZZQNetAlertView.m
//  FItBodyUser
//
//  Created by ben on 17/3/12.
//  Copyright © 2017年 张增强. All rights reserved.
//
/**
 *  网络状态的提示信息
 */
#import "ZZQNetAlertView.h"

@interface ZZQNetAlertView ()

//提示文字
@property(nonatomic, strong)UILabel * label;
//保存一下高度
@property(nonatomic, assign)CGFloat height;

@end

@implementation ZZQNetAlertView

//设置提示的view
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        _height = frame.size.height;
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        [_label setFont:[UIFont systemFontOfSize:13]];
        [_label setTextColor:[UIColor whiteColor]];
        [_label setText:title];
        [_label setTextAlignment:NSTextAlignmentCenter];
        [self setBackgroundColor:[UIColor colorWithRed:0.42 green:0.74 blue:1.00 alpha:1.00]];
        self.clipsToBounds = YES;
        [self setSize:CGSizeMake(self.width, 0)];
        [self addSubview:_label];
    }
    return self;
}

/**
 * 设置动画
 */
- (void)setViewForAnimal{
    [UIView animateWithDuration:0.8 animations:^{
        [self setViewShow];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:1.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
            [self setViewHidden];
        } completion:^(BOOL finished) {
            
        }];
    }];
}
//view展示出来
- (void)setViewShow{
    [self setSize:CGSizeMake(self.width, _height)];
}
//view隐藏
- (void)setViewHidden{
    [self setSize:CGSizeMake(self.width, 0)];
}

@end
