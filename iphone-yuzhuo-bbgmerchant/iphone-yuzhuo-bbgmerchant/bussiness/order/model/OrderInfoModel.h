//
//  OrderInfoModel.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/31.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderInfoModel : NSObject

/** orderId */
@property (nonatomic,strong) NSString *orderId;
/** contactName */
@property (nonatomic,strong) NSString *contactName;
/** phoneNum */
@property (nonatomic,strong) NSString *phoneNum;
/** address */
@property (nonatomic,strong) NSString *address;
/** timeRange */
@property (nonatomic,strong) NSString *timeRange;
/** payMethod */
@property (nonatomic,strong) NSString *payMethod;
/** status */
@property (nonatomic,strong) NSString *status;
/** time */
@property (nonatomic,strong) NSString *time;

@end
