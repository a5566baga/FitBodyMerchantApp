//
//  ZZQHomeTableViewCell.m
//  FItBodyMerchant
//
//  Created by ben on 17/4/2.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQHomeTableViewCell.h"

@interface ZZQHomeTableViewCell ()

@property(nonatomic, strong)ZZQMenus * menu;
@property(nonatomic, strong)NSIndexPath * index;
//图片view
@property(nonatomic, strong)UIImageView * picImage;
//名称label
@property(nonatomic, strong)UILabel * nameLabel;
//价格label
@property(nonatomic, strong)UILabel * priceLabel;
//剩余label
@property(nonatomic, strong)UILabel * leftLabel;
//卖出label
@property(nonatomic, strong)UILabel * soldLabel;

@end

@implementation ZZQHomeTableViewCell

- (void)initForCell{
    CGFloat margin = 15;
    CGFloat picW = 100;
    _picImage = [[UIImageView alloc] initWithFrame:CGRectMake(margin, margin, picW, picW)];
    _picImage.image = [UIImage imageWithData:_menu.portrait];
    [self.contentView addSubview:_picImage];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_picImage.frame)+margin, margin, SCREEN_WIDTH/2, 50)];
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _nameLabel.text = _menu.name;
    [self.contentView addSubview:_nameLabel];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.origin.x, CGRectGetMaxY(_nameLabel.frame), 100, 20)];
    _priceLabel.font = [UIFont systemFontOfSize:16];
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.text = [NSString stringWithFormat:@"￥%@", _menu.price];
    [self.contentView addSubview:_priceLabel];
    
    CGFloat numW = (SCREEN_WIDTH-2*margin-picW)/2;
    _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(_priceLabel.origin.x, CGRectGetMaxY(_picImage.frame)-20, numW, 20)];
    _leftLabel.font = [UIFont systemFontOfSize:14];
    _leftLabel.textColor = [UIColor grayColor];
    _leftLabel.text = [NSString stringWithFormat:@"剩余%@", _menu.left];
    [self.contentView addSubview:_leftLabel];
    
    _soldLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_leftLabel.frame), _leftLabel.origin.y, numW, 20)];
    _soldLabel.font = [UIFont systemFontOfSize:14];
    _soldLabel.textColor = [UIColor grayColor];
    _soldLabel.text = [NSString stringWithFormat:@"已售%@", _menu.orderedNum];
    [self.contentView addSubview:_soldLabel];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIView * view in [self.contentView subviews]) {
        [view removeFromSuperview];
    }
    [self initForCell];
}

- (void)setCellModel:(ZZQMenus *)menu index:(NSIndexPath *)index{
    _menu = menu;
    _index = index;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
