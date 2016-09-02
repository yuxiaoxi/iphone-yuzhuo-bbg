//
//  RadioButton.h
//  SZDT_Partents
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 szdt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RadioButtonDelegate <NSObject>
-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString*)groupId;
@end
@interface RadioButton : UIView
{
    NSString *_groupId;
    NSUInteger _index;
    UIButton *_button;
}
@property(nonatomic,retain)NSString *groupId;
@property(nonatomic,assign)NSUInteger index;

-(id)initWithGroupId:(NSString*)groupId index:(NSUInteger)index;
+(void)addObserverForGroupId:(NSString*)groupId observer:(id)observer;

// 可以设置默认选中项
- (void) setChecked:(BOOL)isChecked;
@end
