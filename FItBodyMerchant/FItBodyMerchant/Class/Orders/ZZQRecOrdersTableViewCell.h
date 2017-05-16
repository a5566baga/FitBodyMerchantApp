//
//  ZZQRecOrdersTableViewCell.h
//  FItBodyMerchant
//
//  Created by ben on 17/5/15.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZQOrders.h"

@interface ZZQRecOrdersTableViewCell : UITableViewCell

- (void)setOrderModle:(ZZQOrders *)order indexPath:(NSIndexPath *)index;

@end
