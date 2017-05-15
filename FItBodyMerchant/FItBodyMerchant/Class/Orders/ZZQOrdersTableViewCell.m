//
//  ZZQOrdersTableViewCell.m
//  FItBodyMerchant
//
//  Created by ben on 17/4/20.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQOrdersTableViewCell.h"
#import "ZZQOrderTemp.h"

@interface ZZQOrdersTableViewCell ()

@property(nonatomic, strong)ZZQOrders * order;
//时间label
@property(nonatomic, strong)UILabel * timeLabel;
//联系人label
@property(nonatomic, strong)UILabel * recPeosonLabel;
//送货地点label
@property(nonatomic, strong)UILabel * addressLabel;
//订单内容label
@property(nonatomic, strong)UILabel * orderLaebl;
//金额label
@property(nonatomic, strong)UILabel * priceLabel;
//接单button
@property(nonatomic, strong)UIButton * yesButton;
//拒单button
@property(nonatomic, strong)UIButton * noButton;

@end

@implementation ZZQOrdersTableViewCell

- (void)initForCell{
    
}

- (void)setOrderModle:(ZZQOrders *)order{
    _order = order;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIView * view in [self.contentView subviews]) {
        [view removeFromSuperview];
    }
    [self initForCell];
}

//工具，自动计算高度
-(float)rowHeightByString:(NSString *)content font:(UIFont *)font width:(CGFloat)width{
    CGSize mySize = CGSizeMake(width, CGFLOAT_MAX);
    CGSize size = [content boundingRectWithSize:mySize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
