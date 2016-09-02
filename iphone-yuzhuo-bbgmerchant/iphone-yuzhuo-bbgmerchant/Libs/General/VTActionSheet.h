//
//  VTActionSheet.h
//  SZDT_Partents
//
//  Created by szdt on 15/6/2.
//  Copyright (c) 2015年 szdt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VTActionSheet;
@protocol VTActionSheetDelegate <NSObject>

- (void)actionSheet:(VTActionSheet *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex;
@end

@interface VTActionSheet : UIView
//{
//    /*
//     * 所有按钮
//     */
//    NSArray *_buttonTitles;
//}

@property (nonatomic,strong)NSArray *buttonTitles;


+ (instancetype)sheetWithTitle:(NSString *)title
                  buttonTitles:(NSArray *)titles
                redButtonIndex:(NSInteger)buttonIndex
                      delegate:(id<VTActionSheetDelegate>)delegate;

- (instancetype)initWithTitle:(NSString *)title
                 buttonTitles:(NSArray *)titles
               redButtonIndex:(NSInteger)buttonIndex
                     delegate:(id<VTActionSheetDelegate>)delegate;

- (void)show;
@end
