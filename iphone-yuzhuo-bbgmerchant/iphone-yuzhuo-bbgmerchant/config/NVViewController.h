//
//  NVViewController.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/22.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IrisStyle.h"
#import "BBGConfig.h"
#import "BBGToast.h"
#import "AFNHelper.h"
#import "BBGURLConfig.h"
@interface NVViewController : UIViewController
/** BBGToast */
@property (nonatomic,strong) BBGToast *bt;

-(NSString*)setParams:(NSDictionary*)dc;
@end
