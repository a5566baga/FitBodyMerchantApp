//
//  ZZQRecOrdersTableViewCell.m
//  FItBodyMerchant
//
//  Created by ben on 17/5/15.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQRecOrdersTableViewCell.h"
#import "ZZQOrderTemp.h"
#import "ZZQAddress.h"

@interface ZZQRecOrdersTableViewCell ()

@property(nonatomic, strong)ZZQOrders * order;
@property(nonatomic, strong)NSIndexPath * index;
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

@implementation ZZQRecOrdersTableViewCell


- (void)initForCell{
    CGFloat margin = 25;
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, margin)];
    _timeLabel.font = [UIFont systemFontOfSize:13];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    NSDateFormatter * fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    _timeLabel.text = [fmt stringFromDate:_order.updatedAt];
    [self.contentView addSubview:_timeLabel];
    
    _recPeosonLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, margin, SCREEN_WIDTH, margin)];
    _recPeosonLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_recPeosonLabel];
    
    _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 2*margin, SCREEN_WIDTH, margin)];
    _addressLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_addressLabel];
    
    _orderLaebl = [[UILabel alloc] initWithFrame:CGRectMake(15, 3.5*margin, SCREEN_WIDTH-30, margin)];
    _orderLaebl.numberOfLines = 0;
    _orderLaebl.font = [UIFont systemFontOfSize:12];
    _orderLaebl.textColor = [UIColor grayColor];
    [self.contentView addSubview:_orderLaebl];
}

- (void)initForPriceView{
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_orderLaebl.frame), SCREEN_WIDTH-40, 30)];
    _priceLabel.textColor = [UIColor colorWithRed:0.97 green:0.36 blue:0.33 alpha:1.00];
    _priceLabel.font = [UIFont systemFontOfSize:14];
    _priceLabel.text = [NSString stringWithFormat:@"金额：%@", _order.orderPrice];
    [self.contentView addSubview:_priceLabel];
}

- (void)initForData{
    __weak typeof(self)myself = self;
    AVQuery * query = [AVQuery queryWithClassName:@"OrderTemp"];
    [query whereKey:@"ordersID" equalTo:_order.objId];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects.count > 0) {
            NSString * str = @"";
            for (AVObject * obj in objects) {
                ZZQOrderTemp * temp = [[ZZQOrderTemp alloc] init];
                temp = [temp setOrderTempForObj:obj];
                str = [str stringByAppendingString:[NSString stringWithFormat:@"%@ x%@\n", temp.menuName, temp.menuNum]];
            }
            _orderLaebl.height = [myself rowHeightByString:str font:[UIFont systemFontOfSize:12] width:SCREEN_WIDTH-30];
            _orderLaebl.text = str;
            [myself initForPriceView];
        }
    }];
    
    AVQuery * query2 = [AVQuery queryWithClassName:@"Addresses"];
    [query2 whereKey:@"objectId" equalTo:_order.addressId];
    [query2 findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects.count > 0) {
            ZZQAddress * address = [[ZZQAddress alloc] init];
            address = [address setModleForObject:objects[0]];
            _recPeosonLabel.text = [NSString stringWithFormat:@"%@ %@ %@", address.consigneeName, address.sex, address.consigneePhone];
            _addressLabel.text = [NSString stringWithFormat:@"%@", address.address];
        }
    }];
}

- (void)setOrderModle:(ZZQOrders *)order indexPath:(NSIndexPath *)index{
    _order = order;
    _index = index;
    [self initForData];
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
