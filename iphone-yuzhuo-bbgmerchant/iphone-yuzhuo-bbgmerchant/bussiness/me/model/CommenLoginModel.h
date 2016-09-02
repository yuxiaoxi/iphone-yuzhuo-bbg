//
//  CommenLoginModel.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/24.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseModel.h"
#import "ComenLoginDataModel.h"
@interface CommenLoginModel : ResponseModel


/** data */
@property (nonatomic,strong)ComenLoginDataModel<Optional> *data;


@end
