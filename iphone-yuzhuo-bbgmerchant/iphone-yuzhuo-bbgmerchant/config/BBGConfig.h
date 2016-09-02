//
//  BBGConfig.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/22.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <Foundation/Foundation.h>



#define VTColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kImageSize 20
#define SZUserDefault [NSUserDefaults standardUserDefaults]
#define ReleaseUrl @"http://115.28.109.243:8080"
#define DebugUrl @"http://115.28.44.175:8080"
//第三方服务的key
#define UmengAppKey @"550a9500fd98c55ab1000f57"//友盟分享appKey
#define ShareQQAppID @"1104418201"//腾讯appID
#define ShareQQAppKey @"ypxK0NC3YD3ZbagT"//腾讯appKey
#define WetChatAppId @"wx7b1afe37e90787fc"//微信appID
#define WetChatAppSecret @"2bd06ca54d0aca139be9f6e89c04355f"//微信appSecret
#define SMSMobAppKey @"683feb4e2540"//MobAppKey
#define SMSMobAppSecret @"8ad765a4dae8d2d2948ff72944b0d8a0"
#define SMSMobAppKeyTest @"114ed22f249fe"//MobAppKey--测试使用
#define SMSMobAppSecretTest @"59c4b7aa8864140c2512acfaeb81e063"
#define BuglyKey @"900021400"

#define WINDOW_ROOTVIEWCONTROLLER_NEEDCHANGE @"WINDOW_ROOTVIEWCONTROLLER_NEEDCHANGE"
#define ORDER_REFRSH_DATA @"ORDER_REFRSH_DATA"

#define i2s(i)  [NSString stringWithFormat:@"%@", (@(i))]
