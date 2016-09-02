//
//  OrderListTableCell.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/31.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderInfoModel.h"

@interface OrderListTableCell : UITableViewCell
/** data */
@property (nonatomic,strong) OrderInfoModel *data;
@end
