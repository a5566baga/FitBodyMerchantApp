//
//  ZZQOrdersTableViewCell.h
//  FItBodyMerchant
//
//  Created by ben on 17/4/20.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZQOrders.h"

@interface ZZQOrdersTableViewCell : UITableViewCell

@property(nonatomic, copy)void(^btnBlock)(NSString * btnTitle, NSIndexPath * index);

- (void)setOrderModle:(ZZQOrders *)order indexPath:(NSIndexPath *)index;

@end
