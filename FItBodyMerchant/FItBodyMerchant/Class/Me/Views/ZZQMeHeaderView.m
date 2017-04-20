//
//  ZZQMeHeaderView.m
//  FItBodyMerchant
//
//  Created by ben on 17/4/20.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQMeHeaderView.h"
#import "ZZQLoginViewController.h"

@interface ZZQMeHeaderView ()

@property(nonatomic, strong)ZZQMerchants * merchant;
//头像
@property(nonatomic, strong)UIImageView * picView;
//名称
@property(nonatomic, strong)UILabel * nameLabel;
//联系方式
@property(nonatomic, strong)UILabel * phoneLabel;
//退出登录
@property(nonatomic, strong)UIButton * logoutBtn;

@end

@implementation ZZQMeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)initView{
    CGFloat margin = 15;
    CGFloat width = self.height-2*margin;
    _picView = [[UIImageView alloc] initWithFrame:CGRectMake(margin, margin, width, width)];
    _picView.image = [UIImage imageWithData:_merchant.protrait];
    _picView.layer.cornerRadius = width/2;
    _picView.layer.masksToBounds = YES;
    [self addSubview:_picView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_picView.frame)+2*margin, margin, 100, 30)];
    _nameLabel.font = [UIFont systemFontOfSize:18];
    _nameLabel.text = _merchant.name;
    [self addSubview:_nameLabel];
    
    _phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.origin.x, CGRectGetMaxY(_picView.frame)-30, 100, 30)];
    _phoneLabel.font = [UIFont systemFontOfSize:15];
    _phoneLabel.textColor = [UIColor grayColor];
    _phoneLabel.text = _merchant.phone;
    [self addSubview:_phoneLabel];
    
    _logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _logoutBtn.frame = CGRectMake(SCREEN_WIDTH-margin-100, self.height/2-15, 100, 30);
    _logoutBtn.layer.masksToBounds = YES;
    _logoutBtn.layer.cornerRadius = 5;
    _logoutBtn.backgroundColor = [UIColor colorWithRed:0.87 green:0.00 blue:0.09 alpha:1.00];
    [_logoutBtn setTitle:@"登出" forState:UIControlStateNormal];
    [self addSubview:_logoutBtn];
    
    [_logoutBtn addTarget:self action:@selector(logoutAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)logoutAction:(UIButton *)btn{
    [AVUser logOut];
    [UIView animateWithDuration:0.5 animations:^{
        ZZQLoginViewController * loginVC = [[ZZQLoginViewController alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = loginVC;        
    }];
}

- (void)setMerchantValue:(ZZQMerchants *)merchant{
    _merchant = merchant;
    [self initView];
}

@end
