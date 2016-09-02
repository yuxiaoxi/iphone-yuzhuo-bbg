//
//  MTAShowPopDialog.h
//  Artist
//
//  Created by yuzhuo on 16/8/2.
//  Copyright © 2016年 大众点评. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger, MTAShowPopDialogAcctionType) {
    MTAShowPopDialogTypeLeft = 0,
    MTAShowPopDialogTypeRight,
    MTAShowPopDialogTypeDelete
};
typedef NS_ENUM(NSInteger, MTAShowPopDialogType) {
    //底部显示两个按钮
    MTAShowPopDialogTypeZero = 0,
    //底部只显示一个按钮
    MTAShowPopDialogTypeOne
};

typedef void(^MTAShowPopDialogBlock)(MTAShowPopDialogAcctionType type);


@interface MTAShowPopDialog : UIView
/** 代理 */
//@property (nonatomic,assign)id<MTAShowPopDialogDelegate> delegate;
-(void) initData:(NSInteger) type title:(NSString*)title content:(NSString*)content leftBtnName:(NSString*)leftBtnName rightBtnName:(NSString*) rigthBtnName showCheck:(BOOL) showCheck showDeleteBtn:(BOOL) showDeleteBtn;
-(void)showPopDialog;
-(void)colorWithLeftBtnConvertRightBtn:(BOOL) convert;

- (void)showAlertWithType:(MTAShowPopDialogType )type title:(NSString *)title content:(NSString*)content leftBtnName:(NSString*)leftBtnName rightBtnName:(NSString*) rigthBtnName showCheck:(BOOL) showCheck showDeleteBtn:(BOOL) showDeleteBtn block:(MTAShowPopDialogBlock )block;


@end
