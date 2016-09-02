//
//  OrderListModel.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/31.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import "ResponseModel.h"
#import "OrderInfoModel.h"

@interface OrderListModel : ResponseModel

/** data */
@property (nonatomic,strong) NSMutableArray<OrderInfoModel*><Optional> *data;

@end
