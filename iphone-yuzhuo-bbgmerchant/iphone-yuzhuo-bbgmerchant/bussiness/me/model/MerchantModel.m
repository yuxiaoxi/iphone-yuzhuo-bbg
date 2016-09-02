//
//  MerchantModel.m
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/24.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import "MerchantModel.h"

@implementation MerchantModel

+(JSONKeyMapper*)keyMapper{
    
    //替换 转换中 相关属性
    
    //将字典中id的值 给 uid属性
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"uuid"}];
    
}

@end
