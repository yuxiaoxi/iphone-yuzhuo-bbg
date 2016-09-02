//
//  MerchantModel.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/24.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface MerchantModel : JSONModel

/** sid */
@property (nonatomic,strong) NSString *sid;
/** sbid */
@property (nonatomic,strong) NSString *time;
/** job */
@property (nonatomic,strong) NSString *job;

/** uid */
@property (nonatomic,strong) NSString *uid;

/** editor */
@property (nonatomic,strong) NSString *editor;

/** uuid */
@property (nonatomic,strong) NSString *uuid;
@end
