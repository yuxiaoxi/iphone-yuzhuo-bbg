//
//  NVSlideSegmentView.m
//  bbg
//
//  Created by 　yuzhuo on 16/8/31.
//  Copyright © 2016年 All rights reserved.
//

#import "NVSlideSegmentView.h"
#import "IrisStyle.h"
#import "UIView+Layout.h"
#import "UIButton+Badge.h"
#import "BBGConfig.h"
@interface NVSlideSegmentView ()

@property (nonatomic, strong) UIView * indicatorBarView;
@property (nonatomic, strong) NSMutableArray * segmentedControlButtons;
@property (nonatomic, assign) CGFloat btnWidth;
@property (nonatomic, assign) NSInteger selectedButtonIndex;
@property (nonatomic, strong) UILabel * horizonLine;
@end

@implementation NVSlideSegmentView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self makeupWithTitleArray:titleArray];
        [self updateButtons];
    }
    return self;
}

- (void)makeupWithTitleArray:(NSArray *)titleArray
{

    self.segmentedControlButtons = [[NSMutableArray alloc] init];
    NSInteger num = titleArray.count;
    CGFloat originX = 0;
    self.btnWidth = self.width / num;
    self.indicatorBarView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 4, self.btnWidth, 3)];
    self.indicatorBarView.backgroundColor = [UIColor nvColorWithff9933];
    self.horizonLine = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 2.f, kScreenW, 1.f)];
//    self.horizonLine.backgroundColor = [UIColor colorWithHexString:@"#D7D7D7"];
//    self.horizonLine.textColor = [UIColor colorWithHexString:@"#D7D7D7"];

    for (NSInteger index = 0; index < num; index++) {

        CGRect rect = CGRectMake(originX, 0, self.btnWidth, self.height);
        UIButton * button = [[UIButton alloc] initWithFrame:rect];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor nvColorWithff9933] forState:UIControlStateDisabled];

        NSString * title = [titleArray objectAtIndex:index];
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:index];
        [self addSubview:button];
        [self.segmentedControlButtons addObject:button];
        originX += self.btnWidth;
    }
    [self addSubview:self.horizonLine];
    [self addSubview:self.indicatorBarView];
}

- (void)setSelectedIndexAt:(NSInteger)index
{
    if (index > self.segmentedControlButtons.count) {
        return;
    }
    UIButton * button = [self.segmentedControlButtons objectAtIndex:index];
    [self buttonSelected:button];
}

- (void)setBadgeAtIndex:(NSInteger)index badge:(NSString *)badge;
{
    if (index > self.segmentedControlButtons.count) {
        return;
    }
    UIButton * button = [self.segmentedControlButtons objectAtIndex:index];
    button.badge = badge;
}

- (void)setSegmentTitle:(NSString *)title AtIndex:(NSInteger )index
{
    if (index > self.segmentedControlButtons.count) {
        return;
    }
    UIButton * button = [self.segmentedControlButtons objectAtIndex:index];
    [button setTitle:title forState:UIControlStateNormal];
}

- (void)buttonSelected:(UIButton *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.indicatorBarView setFrame:CGRectMake(sender.tag*self.btnWidth, self.indicatorBarView.origin.y, self.btnWidth, 3)];
    }];

    self.selectedButtonIndex = sender.tag;
    [self updateButtons];
    [self.delegate onSelectedButtonChanged:sender.tag];
}

- (void)updateButtons
{

    NSInteger num = self.segmentedControlButtons.count;

    for (NSInteger index = 0; index < num; index++) {

        UIButton * button = [self.segmentedControlButtons objectAtIndex:index];

        if (self.selectedButtonIndex == index) {
            [button setSelected:YES];
            button.enabled = NO;
            [button setTitleColor:[UIColor nvColorWithff9933] forState:UIControlStateNormal];
        } else {
            [button setSelected:NO];
            button.enabled = YES;
            [button setTitleColor:[UIColor nvColorWithcccccc] forState:UIControlStateNormal];
        }
    }
}

@end
