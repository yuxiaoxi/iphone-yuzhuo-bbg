//
//  BBGToast.h
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/23.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import <UIKit/UIKit.h>
enum TimeType
{
    LongTime,
    ShortTime
};

@interface BBGToast : UIView
{
    UILabel* _label;
    NSString * _text;
    enum TimeType _time;
}
+(BBGToast *)makeText:(NSString *)text;
-(void)showWithType:(enum TimeType)type;
@end
