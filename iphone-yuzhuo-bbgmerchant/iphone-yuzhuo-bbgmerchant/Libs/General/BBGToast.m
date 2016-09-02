//
//  BBGToast.m
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/23.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import "BBGToast.h"
#import "BBGConfig.h"
static BBGToast * _toast = nil;

@implementation BBGToast

- (id)initWithText:(NSString*)text
{
    self = [super init];
    if (self) {
        _text = [text copy];
        // Initialization code
        UIFont *font = [UIFont systemFontOfSize:16];
        CGSize textSize = [_text sizeWithFont:font constrainedToSize:CGSizeMake(kScreenW, 60)];
        //leak;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, textSize.width, textSize.height)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = font;
        label.text = _text;
        label.numberOfLines = 0;
        label.shadowColor = [UIColor darkGrayColor];
        label.shadowOffset = CGSizeMake(1, 1);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        CGRect rect;
        rect.size = CGSizeMake(textSize.width + 20, textSize.height + 10);
        rect.origin = CGPointMake((kScreenW-rect.size.width)/2, kScreenH*0.8);
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        [self setFrame:rect];
        [self addSubview:label];
    }
    return self;
}


+(BBGToast *)makeText:(NSString *)text{
    @synchronized(self){
        if(_toast == nil){
            _toast = [[BBGToast alloc]initWithText:text];
        }
    }
    return _toast;
}

-(void)showWithType:(enum TimeType)type{
    if (type == LongTime) {
        _time = 3.0f;
    }
    else{
        _time = 1.0f;
    }
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    NSTimer *timer1 = [NSTimer timerWithTimeInterval:(_time/4.0f)  target:self selector:@selector(removeToast) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer1 forMode:NSDefaultRunLoopMode];
    [window addSubview:self];
}

-(void)removeToast
{
    [UIView animateWithDuration:_time animations:^{
        if (_toast.alpha!=0.0f) {
            _toast.alpha -= 0.3f;
        }
    }
         completion:^(BOOL finished) {
             [_toast setAlpha:0];
             [_toast removeFromSuperview];
             _toast = nil;
         }
     ];
}

@end
