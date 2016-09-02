//
//  MTAHomeViewModel.h
//  Artist
//
//  Created by yuzhuo on 16/8/31.
//  Copyright © 2016年  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTAHomeViewModel : NSObject


@property (nonatomic, strong) NSNumber * isLoadingFinish;

@property (nonatomic, strong,readonly) NSArray *arrlist1;
@property (nonatomic, strong,readonly) NSArray *arrlist2;
@property (nonatomic, strong,readonly) NSArray *arrlist3;

@property (nonatomic, strong) NSArray *arrlist;


@property (nonatomic, assign) NSInteger typeSelected;

- (void)sliderChange:(NSInteger)index;


@end
