//
//  OrderModel.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/31.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface OrderModel : NSObject
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *urlaction;
@end
