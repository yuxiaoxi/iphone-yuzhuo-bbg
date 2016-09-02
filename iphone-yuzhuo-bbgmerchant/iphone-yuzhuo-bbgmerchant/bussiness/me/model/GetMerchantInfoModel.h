//
//  GetMerchantInfoModel.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/24.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import "ResponseModel.h"
#import "MerchantModel.h"
@interface GetMerchantInfoModel : ResponseModel

/** data */
@property (nonatomic,strong)MerchantModel<Optional> *data;

@end
