//
//  ZZQRecOrdersTableViewCell.m
//  FItBodyMerchant
//
//  Created by ben on 17/5/15.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQRecOrdersTableViewCell.h"

@interface ZZQRecOrdersTableViewCell ()

@property(nonatomic, strong)ZZQOrders * order;

@end

@implementation ZZQRecOrdersTableViewCell


- (void)setOrderModle:(ZZQOrders *)order{
    _order = order;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
