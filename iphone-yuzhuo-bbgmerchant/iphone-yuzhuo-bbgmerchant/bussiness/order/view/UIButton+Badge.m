//
//  UIButton+Badge.m
//  Artist
//
//  Created by yuzhuo on 16/8/31.
//  Copyright © 2016年 All rights reserved.
//

#import "UIButton+Badge.h"

@interface UIButton ()
@property (nonatomic, strong) UILabel *badgeLabel;
@end

@implementation UIButton (Badge)

- (UILabel *)badgeLabel
{
    UILabel *badglble = objc_getAssociatedObject(self, _cmd);
    if (!badglble) {
        badglble = [UILabel new];
        [self setBadgeLabel:badglble];
        [self addSubview:badglble];
        badglble.hidden = YES;
    }
    return badglble;
}

-(void)setBadgeLabel:(UILabel *)badgeLabel
{
    objc_setAssociatedObject(self, @selector(badgeLabel), badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)badge
{
    NSString *badgestr = objc_getAssociatedObject(self, _cmd);
    if (!badgestr) {
        badgestr = [NSString string];
        [self setBadge:badgestr];
    }
    return badgestr;
}

 -(void)setBadge:(NSString *)badge
{
    objc_setAssociatedObject(self, @selector(badge), badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self showBadgeLable];
}

- (void)showBadgeLable
{
    if (self.badge && self.badge.length) {
        self.badgeLabel.hidden = NO;
        self.badgeLabel.backgroundColor = [UIColor redColor];
        self.badgeLabel.textColor = [UIColor whiteColor];
        self.badgeLabel.textAlignment = NSTextAlignmentCenter;
        self.badgeLabel.font = [UIFont boldSystemFontOfSize:14];
        self.badgeLabel.text = self.badge;
        CGSize badgeSize = [self sizeToFiteWithString:self.badge size:CGSizeMake(self.frame.size.width, 30) font:[UIFont boldSystemFontOfSize:18]];
        if (badgeSize.width < badgeSize.height) {
            badgeSize = CGSizeMake(badgeSize.height, badgeSize.height);
            if (self.badge.length >= 2) {
                badgeSize = CGSizeMake(badgeSize.height + 5, badgeSize.height);
            }
        }
        [self layoutIfNeeded];
        self.badgeLabel.frame = CGRectMake(self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width - 2, self.titleLabel.frame.origin.y - badgeSize.height + 10, badgeSize.width, badgeSize.height);
        self.badgeLabel.layer.masksToBounds = YES;
        self.badgeLabel.layer.cornerRadius = self.badgeLabel.frame.size.height/2;
    }
    else
    {
        self.badgeLabel.hidden = YES;
    }
    
}

- (CGSize)sizeToFiteWithString:(NSString *)string size:(CGSize)size font:(UIFont *)font
{
    return  [string boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}





@end
