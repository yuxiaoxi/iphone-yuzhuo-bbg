//
//  ComenLoginDataModel.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by zhukaiqi on 16/8/24.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ComenLoginDataModel : JSONModel

/** id */
@property (nonatomic,copy) NSString *uId;

/** sessionKey */
@property (nonatomic,copy) NSString *sessionKey;

/** 状态 */
@property (nonatomic,copy) NSString *status;

/** username */
@property (nonatomic,copy) NSString *username;
@end
