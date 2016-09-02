//
//  ResponseModel.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/24.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface ResponseModel :JSONModel

/** code */
@property (nonatomic,assign) NSInteger code;

/** message */
@property (nonatomic,strong) NSString *message;


@end
