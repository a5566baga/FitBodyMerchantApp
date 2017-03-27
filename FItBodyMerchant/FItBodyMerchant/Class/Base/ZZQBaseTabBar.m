//
//  ZZQBaseTabBar.m
//  FItBodyUser
//
//  Created by ben on 17/3/11.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQBaseTabBar.h"

@interface ZZQBaseTabBar ()

@property(nonatomic, strong)NSArray * tabBarNorArray;
@property(nonatomic, strong)NSArray * tabBarSelArray;
@property(nonatomic, strong)UIButton * item;
@property(nonatomic, strong)UIButton * lastItem;
@property(nonatomic, strong)UIImageView * bgImageView;

@end

@implementation ZZQBaseTabBar

#pragma
#pragma ================= 懒加载
- (NSArray *)tabBarNorArray{
    if(!_tabBarNorArray){
        _tabBarNorArray = [NSArray arrayWithObjects:@"hj_main_bottom_home_nol", @"hj_main_bottom_steward_nol", @"hj_main_bottom_mine_nol", nil];
    }
    return _tabBarNorArray;
}

- (NSArray *)tabBarSelArray{
    if(!_tabBarSelArray){
        _tabBarSelArray = [NSArray arrayWithObjects:@"hj_main_bottom_home_sel", @"hj_main_bottom_steward_sel", @"hj_main_bottom_mine_sel", nil];
    }
    return _tabBarSelArray;
}

- (UIImageView *)bgImageView{
    if(!_bgImageView){
        _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
        [_bgImageView setFrame:self.bounds];
    }
    return _bgImageView;
}

#pragma 
#pragma ================= 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgImageView];
        CGFloat width = self.bounds.size.width / self.tabBarNorArray.count;
        CGFloat height = self.frame.size.height;
        for(NSUInteger i = 0; i < self.tabBarSelArray.count; i++){
            _item = [UIButton buttonWithType:UIButtonTypeCustom];
            _item.frame = CGRectMake(width * i, 0, width, height);
            [_item setAdjustsImageWhenHighlighted:NO];
            [_item setImage:[UIImage imageNamed:self.tabBarNorArray[i]] forState:UIControlStateNormal];
            [_item setImage:[UIImage imageNamed:self.tabBarSelArray[i]] forState:UIControlStateSelected];
            [_item setImage:[UIImage imageNamed:self.tabBarNorArray[i]] forState:UIControlStateHighlighted];
            _item.tag = ZZQItemTypeHOME + i;
            [_item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            if(0 == i){
                [_item setSelected:YES];
                _lastItem = _item;
            }
            [self addSubview:_item];   
        }
    }
    return self;
}

- (void)clickItem:(UIButton *)btn{
    
    //设置代理，明确点击那个item
    if([self.delegate respondsToSelector:@selector(zzqTabBar:clickButton:)]){
        [self.delegate zzqTabBar:self clickButton:btn.tag];
    }
    !self.block?:self.block(self, btn.tag);

    //动画效果
    [_lastItem setSelected:NO];
    [btn setSelected:YES];
    _lastItem = btn;
    //设置button动画
    [UIView animateWithDuration:0.2 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            btn.transform = CGAffineTransformIdentity;
        }];
    }];
    
}

#pragma
#pragma ================= 设置位置
-(void)layoutSubviews{
    [super layoutSubviews];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
