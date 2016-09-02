//
//  MTAHomeOrderHeaderView.m
//  边边购
//
//  Created by yuzhuo on 16/8/31.
//  Copyright © 2016年  All rights reserved.
//

#import "MTAHomeOrderHeaderView.h"
#import "NVSlideSegmentView.h"
#import "BBGConfig.h"
#import "MTAHomeViewModel.h"
@interface MTAHomeOrderHeaderView ()<NVSlideSegmentControlDelegate>

@property (nonatomic, strong)   NVSlideSegmentView *segmentControl;

//@property (nonatomic, strong)   MTAHomeViewModel *viewModels;

@end

@implementation MTAHomeOrderHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
        [self initSubViews];
    }
    return self;
}


- (void)initSubViews
{
    [self addSubview:self.segmentControl];
}



- (NVSlideSegmentView *)segmentControl
{
    if (_segmentControl) {
        return _segmentControl;
    }
    NSArray *segTitleArr=[NSArray arrayWithObjects:@"新订单",@"已取消",@"已发货",@"已完成",nil];
    _segmentControl = [[NVSlideSegmentView alloc]initWithFrame:CGRectMake(10, 5, kScreenW - 20, 45) titleArray:segTitleArr];
    [_segmentControl setSelectedIndexAt:0];
    _segmentControl.delegate = self;
    return _segmentControl;
    
}

- (void)onSelectedButtonChanged:(NSInteger)index
{
//    if (self.viewModels) {
//        [self.viewModels sliderChange:index];
        NSLog(@"这是第%@",i2s(index));
    [[NSNotificationCenter defaultCenter]postNotificationName:ORDER_REFRSH_DATA object:nil];
//    }
}


- (NSString *)formatString:(NSInteger )count
{
    if (count) {
        return [NSString stringWithFormat:@"(%@)",i2s(count)];
    }
    return @"";
}




@end
