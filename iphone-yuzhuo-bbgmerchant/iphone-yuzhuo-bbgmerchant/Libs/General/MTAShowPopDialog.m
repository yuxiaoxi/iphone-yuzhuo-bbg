//
//  MTAShowPopDialog.m
//  Artist
//
//  Created by yuzhuo on 16/8/2.
//  Copyright © 2016年 大众点评. All rights reserved.
//

#import "MTAShowPopDialog.h"
#import "BBGConfig.h"
#import "IrisStyle.h"
#import "UIView+Layout.h"
@interface MTAShowPopDialog()
{
    //
    CGFloat marginWidth ;
    CGFloat whiteBgWidth ;
    //内容
    UILabel *warnContent;
    
    CGFloat whiteHeight;
}
//中间顶部的勾
@property (nonatomic, strong) UIImageView *checkImg;
//提示title
@property (nonatomic, strong) UILabel *warnTitle;
@property (nonatomic, strong) UIView *whitebg;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *leftBtnName;
@property (nonatomic, strong) NSString *rigthBtnName;
@property (nonatomic, assign) BOOL showCheck;
@property (nonatomic, assign) BOOL showDeleteBtn;
/** convert */
@property (nonatomic,assign) BOOL convert;

@property (nonatomic, copy) MTAShowPopDialogBlock block;
@end

@implementation MTAShowPopDialog

#pragma mark - lifecycle
-(instancetype)init{
    self = [super init];
    if (self) {
        //
        marginWidth = kScreenW/8;
        whiteBgWidth = kScreenW-2*marginWidth;
    }
    return self;
}

#pragma mark - delegate methods

//删除和关闭弹框事件
- (void)deleteButtonAction:(id)sender {
    if (self.block) {
        self.block(MTAShowPopDialogTypeDelete);
    }
}

//左边按钮点击事件
- (void)leftButtonAction:(id)sender {
    if (self.block) {
        self.block(MTAShowPopDialogTypeLeft);
    }
}

//左边按钮点击事件
- (void)rightButtonAction:(id)sender {
    if (self.block) {
        self.block(MTAShowPopDialogTypeRight);
    }
}

#pragma mark - super methods

-(void) colorWithLeftBtnConvertRightBtn:(BOOL)convert{
    _convert = convert;
}

- (void)showAlertWithType:(MTAShowPopDialogType )type title:(NSString *)title content:(NSString*)content leftBtnName:(NSString*)leftBtnName rightBtnName:(NSString*) rigthBtnName showCheck:(BOOL) showCheck showDeleteBtn:(BOOL) showDeleteBtn block:(MTAShowPopDialogBlock )block
{
    self.block = [block copy];
    [self initData:type title:title content:content leftBtnName:leftBtnName rightBtnName:rigthBtnName showCheck:showCheck showDeleteBtn:showDeleteBtn];
    [self showPopDialog];
}

-(void) initData:(NSInteger)type title:(NSString *)title content:(NSString *)content leftBtnName:(NSString *)leftBtnName rightBtnName:(NSString *)rigthBtnName showCheck:(BOOL) showCheck showDeleteBtn:(BOOL) showDeleteBtn{
    _type = type;
    _title = title;
    _content = content;
    _leftBtnName = leftBtnName;
    _rigthBtnName = rigthBtnName;
    _showCheck = showCheck;
    _showDeleteBtn = showDeleteBtn;
}

#pragma mark - private methods

-(void)initCheckImg{
    //中间顶部的勾
    _checkImg = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW/2-20, kScreenH/2-120, 40, 40)];
    _checkImg.image = [UIImage imageNamed:@"more_dialog_check"];
    if(_showCheck){
        [self addSubview:_checkImg];
    }
}

-(void)initDeleteBtn{
    //删除按钮
    if(_showDeleteBtn){
        UIButton *delete = [[UIButton alloc] initWithFrame:CGRectMake(_whitebg.frame.size.width-28, 10, 18, 18)];
        [delete setBackgroundImage:[UIImage imageNamed:@"more_dialog_delete"] forState:UIControlStateNormal];
        [delete addTarget:self action:@selector(deleteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_whitebg addSubview:delete];
    }

}

-(void)initWarntitle{
    //提示title
    _warnTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, whiteBgWidth-40, 20)];
    _warnTitle.textAlignment = NSTextAlignmentCenter;
    _warnTitle.font = [UIFont systemFontOfSize:20];
    _warnTitle.text = _title;
    [_whitebg addSubview:_warnTitle];
}

-(void)initCloseBtn{
    //关闭按钮
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 80+warnContent.height, whiteBgWidth/2-30, 35)];
    
    [closeButton.layer setMasksToBounds:YES];
    [closeButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    [closeButton.layer setBorderWidth:1.0]; //边框宽度
    
    [closeButton setTitle:_leftBtnName forState:UIControlStateNormal];//button title
    if(_convert){//convertcolor
        [closeButton.layer setBorderColor:[UIColor nvColorwith20a5d9].CGColor];//边框颜色
        closeButton.backgroundColor = [UIColor nvColorwith20a5d9];
        [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//title color
    }else{
        [closeButton.layer setBorderColor:[UIColor nvColorwithe6e8eb].CGColor];//边框颜色
        closeButton.backgroundColor = [UIColor whiteColor];
        [closeButton setTitleColor:[UIColor nvColorwith606060] forState:UIControlStateNormal];//title color
    }
    
    [closeButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_whitebg addSubview:closeButton];
    
}
-(void)initRefreshBtn{
    //更新按钮
    UIButton *refreshButton = [[UIButton alloc] initWithFrame:CGRectMake(whiteBgWidth/2+10, 80+warnContent.height, whiteBgWidth/2-30, 35)];
    
    
    [refreshButton.layer setMasksToBounds:YES];
    [refreshButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    [refreshButton.layer setBorderWidth:1.0]; //边框宽度
    
    [refreshButton setTitle:_rigthBtnName forState:UIControlStateNormal];//button title
    
    if(_convert){//convertcolor
        [refreshButton.layer setBorderColor:[UIColor nvColorwithe6e8eb].CGColor];//边框颜色
        refreshButton.backgroundColor = [UIColor whiteColor];
        [refreshButton setTitleColor:[UIColor nvColorwith606060] forState:UIControlStateNormal];//title color
    }else{
        [refreshButton.layer setBorderColor:[UIColor nvColorwith20a5d9].CGColor];//边框颜色
        refreshButton.backgroundColor = [UIColor nvColorwith20a5d9];
        [refreshButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//title color
    }
    
    [refreshButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_whitebg addSubview:refreshButton];
}

-(void)initConfirmBtn{
    //确认按钮
    UIButton *confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 80+warnContent.height, whiteBgWidth-40, 35)];
    
    confirmButton.backgroundColor = [UIColor nvColorwith20a5d9];
    [confirmButton.layer setMasksToBounds:YES];
    [confirmButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    [confirmButton.layer setBorderWidth:1.0]; //边框宽度
    [confirmButton.layer setBorderColor:[UIColor nvColorwith20a5d9].CGColor];//边框颜色
    [confirmButton setTitle:_leftBtnName forState:UIControlStateNormal];//button title
    [confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//title color
    [confirmButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_whitebg addSubview:confirmButton];

}

-(void)initWarnContent{
    //内容
    warnContent = [UILabel new];
    warnContent.font = [UIFont systemFontOfSize:13];
    warnContent.text = _content;
    warnContent.numberOfLines = 0;
    warnContent.textColor = [UIColor nvColorwith606060];
    CGSize titleSize = [_content boundingRectWithSize:CGSizeMake(whiteBgWidth-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    warnContent.size = titleSize;
    
    warnContent.font = [UIFont systemFontOfSize:13];
    warnContent.textAlignment = NSTextAlignmentCenter;
    warnContent.centerX = whiteBgWidth/2;
    warnContent.centerY = 60+warnContent.height/2;
    whiteHeight = 135+warnContent.height;
}

-(void)initWhiteBg{
    _whitebg = [[UIView alloc] initWithFrame:CGRectMake(marginWidth, kScreenH/2-100, whiteBgWidth, whiteHeight)];
    _whitebg.backgroundColor = [UIColor whiteColor];
    [_whitebg.layer setMasksToBounds:YES];
    [_whitebg.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    [_whitebg.layer setBorderWidth:1.0]; //边框宽度
    [_whitebg.layer setBorderColor:[UIColor whiteColor].CGColor];//边框颜色
}

-(void)showPopDialog{
    
    [self initWarnContent];
    //内容
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self initWhiteBg];
    [self initDeleteBtn];
    [self initWarntitle];
    [_whitebg addSubview:warnContent];
    
    if(_type == MTAShowPopDialogTypeZero){//不需要更新[self _doClickShowModalDialog];
        //关闭按钮
        [self initCloseBtn];
        //更新按钮
        [self initRefreshBtn];
    }else if(_type == MTAShowPopDialogTypeOne)
    {//需要更新
        //确认按钮
        [self initConfirmBtn];
    }
    [self addSubview:_whitebg];
    [self initCheckImg];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
}

@end
