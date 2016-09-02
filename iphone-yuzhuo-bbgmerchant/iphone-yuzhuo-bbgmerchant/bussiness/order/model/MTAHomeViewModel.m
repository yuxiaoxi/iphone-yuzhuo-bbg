
 //
//  MTAHomeViewModel.m
//  Artist
//
//  Created by yuzhuo on 16/8/31.
//  Copyright © 2016年 All rights reserved.
//

#import "MTAHomeViewModel.h"

@interface MTAHomeViewModel ()
@property (nonatomic, strong,readwrite) NSArray *arrlist1;
@property (nonatomic, strong,readwrite) NSArray *arrlist2;
@property (nonatomic, strong,readwrite) NSArray *arrlist3;

@end

@implementation MTAHomeViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        _isLoadingFinish = @NO;
    }
    return self;
}

- (void)sliderChange:(NSInteger)index
{
    self.typeSelected = index;
    switch (index) {
        case 0:
        {
            self.arrlist = self.arrlist1;
        }
            break;
        case 1:
        {
            self.arrlist = self.arrlist2;
        }
            break;
        case 2:
        {
            self.arrlist = self.arrlist3;
        }
            break;
        default:
            break;
    }
}

- (void)setLocalArrlist:(NSArray *)arrlist
{
    switch (self.typeSelected) {
        case 0:
        {
            self.arrlist1 = arrlist;
        }
            break;
        case 1:
        {
            self.arrlist2 = arrlist;
        }
            break;
        case 2:
        {
            self.arrlist3 = arrlist;
        }
            break;
        default:
            break;
    }
    [self sliderChange:self.typeSelected];
}

@end
