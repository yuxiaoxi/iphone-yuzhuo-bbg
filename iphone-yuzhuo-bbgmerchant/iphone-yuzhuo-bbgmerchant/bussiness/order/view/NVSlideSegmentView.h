//
//  NVSlideSegmentView.h
//  Jovi
//
//  Created by 　yuzhuo on 16/8/31.
//  Copyright © 2016年 All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol NVSlideSegmentControlDelegate
- (void)onSelectedButtonChanged:(NSInteger)index;
@end



@interface NVSlideSegmentView : UIView

@property(nonatomic,retain) id <NVSlideSegmentControlDelegate> delegate;

-(id) initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

- (void)setSelectedIndexAt:(NSInteger)index;

- (void)setBadgeAtIndex:(NSInteger)index badge:(NSString *)badge;

- (void)setSegmentTitle:(NSString *)title AtIndex:(NSInteger )index;

@end

