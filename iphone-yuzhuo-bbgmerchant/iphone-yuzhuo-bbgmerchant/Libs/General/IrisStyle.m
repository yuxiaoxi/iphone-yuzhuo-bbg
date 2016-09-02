//
//  IrisStyle.m
//  Artist
//
//  Created by Jack on 16/8/2.
//  Copyright © 2016年 大众点评. All rights reserved.
//

#import "IrisStyle.h"
#import "UIColor+Util.h"

@implementation UIColor (Iris)



+ (UIColor *)nvColorwithedaf43
{
    return  [UIColor colorWithHexString:@"#edaf43"];
}

+ (UIColor *)nvColorWithc2c7c8
{
    return [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6];
}

+ (UIColor *)nvColorWithff9933
{
    return  [UIColor colorWithHexString:@"#ff9933"];
}

+ (UIColor *)nvColorWithcccccc
{
    return  [UIColor colorWithHexString:@"#cccccc"];
}

+ (UIColor *)nvColorwith606060
{
    return  [UIColor colorWithHexString:@"#606060"];
}
+ (UIColor *)nvColorwith20a5d9{
    return  [UIColor colorWithHexString:@"#20a5d9"];
}

+(UIColor *)nvColorwithe6e8eb{
    return  [UIColor colorWithHexString:@"#e6e8eb"];
}

@end

@implementation UIFont (Iris)

//18
+ (UIFont *)irisTitleBoldFont
{
    return [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
}

//18
+ (UIFont *)irisTitleFont
{
    return [UIFont fontWithName:@"Helvetica" size:15.0];
}


//12
+ (UIFont *)irisContentBoldFont
{
    return  [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
}

+ (UIFont *)irisNomalFont:(CGFloat)size
{
    return  [UIFont fontWithName:@"Helvetica" size:size];
}
+ (UIFont *)irisBoldFont:(CGFloat)size
{
    return  [UIFont fontWithName:@"Helvetica-Bold" size:size];
}
//12
+ (UIFont *)irisContentFont
{
    return  [UIFont fontWithName:@"Helvetica" size:12.0];
}


@end
