//
//  NVViewController.m
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/22.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import "NVViewController.h"

@interface NVViewController ()


@end

@implementation NVViewController

#pragma mark - viewController.lifeCircle
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor nvColorWithff9933];
    
}


#pragma mark - super methods
-(NSString*)setParams:(NSDictionary*)dc{
    if(dc == nil){
        return @"";
    }
    
    NSMutableString *mutStr = [[NSMutableString alloc]initWithString:@"{"];
    for (NSString *key in dc) {
        [mutStr appendString:@"\""];
        [mutStr appendString:key];
        [mutStr appendString:@"\":\""];
        [mutStr appendString:dc[key]];
        [mutStr appendString:@"\","];
    }
    if([dc count]>0){
        if([mutStr hasSuffix:@","]){
            [mutStr deleteCharactersInRange:NSMakeRange([mutStr length]-1, 1)];
        }
        [mutStr appendString:@"}"];
        return (NSString *)mutStr;
    }
    return @"";
}


@end
