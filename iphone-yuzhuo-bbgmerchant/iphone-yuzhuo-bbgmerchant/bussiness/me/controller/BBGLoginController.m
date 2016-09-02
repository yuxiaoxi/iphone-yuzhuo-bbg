//
//  BBGLoginController.m
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/23.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import "BBGLoginController.h"
#import "AFNetworking.h"
#import "MTAShowPopDialog.h"
#import "CommenLoginModel.h"
#import "GetMerchantInfoModel.h"

@interface BBGLoginController ()<UITextFieldDelegate>
{
    UITextField *_textFieldAccount;
    UITextField *_textFieldPsw;
}
/** 弹框视图 */
@property (nonatomic, strong) MTAShowPopDialog *showPopDialog;
@end

@implementation BBGLoginController

#pragma  mark - lifecircle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    // Do any additional setup after loading the view.
}

#pragma  mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //当用户按下ruturn，把焦点从textField移开那么键盘就会消失了
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - private methods

-(void)initViews{
    CGFloat imgMarginLeft = kScreenW/4;
    
    //顶部logo
    UIImageView *logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(imgMarginLeft, imgMarginLeft, imgMarginLeft*2, imgMarginLeft*0.8)];
    logoImage.image = [UIImage imageNamed:@"login_Bg"];
    [logoImage setContentMode:UIViewContentModeScaleAspectFill];
    logoImage.clipsToBounds = YES;
    //帐号
    _textFieldAccount = [[UITextField alloc]initWithFrame:CGRectMake(30, imgMarginLeft*1.8+40, kScreenW-60, 50)];
    _textFieldAccount.delegate = self;
    _textFieldAccount.clearButtonMode=UITextFieldViewModeWhileEditing;
    _textFieldAccount.layer.borderColor = [UIColor nvColorWithff9933].CGColor;
    _textFieldAccount.placeholder = @"帐号";
    _textFieldAccount.layer.borderWidth= 1.0f;
    [_textFieldAccount.layer setMasksToBounds:YES];
    [self setTextFieldLeftPadding:_textFieldAccount forWidth:10];
    //密码
    _textFieldPsw = [[UITextField alloc]initWithFrame:CGRectMake(30, imgMarginLeft*1.8+130, kScreenW-60, 50)];
    _textFieldPsw.delegate = self;
    _textFieldPsw.clearButtonMode=UITextFieldViewModeWhileEditing;
    _textFieldPsw.placeholder = @"密码";
    [_textFieldPsw.layer setBorderWidth:1.0];
    [_textFieldPsw.layer setBorderColor:[UIColor nvColorWithff9933].CGColor];
    [_textFieldPsw.layer setMasksToBounds:YES];
    [self setTextFieldLeftPadding:_textFieldPsw forWidth:10];
    //登录账号按钮
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(30, imgMarginLeft*1.8+230, kScreenW-60, 45)];
    loginButton.backgroundColor = [UIColor nvColorWithff9933];
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    [loginButton.layer setBorderWidth:1.0]; //边框宽度
    [loginButton.layer setBorderColor:[UIColor nvColorWithff9933].CGColor];//边框颜色
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];//button title
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//title color
    [loginButton addTarget:self action:@selector(loginClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoImage];
    [self.view addSubview:_textFieldAccount];
    [self.view addSubview:_textFieldPsw];
    [self.view addSubview:loginButton];
}

//登录按钮点击事件
- (void)loginClickAction:(id)sender {
    [self commenLogin];
//    self.bt = [BBGToast makeText:@"登录成功"];
//    [self.bt showWithType:ShortTime];
//    [self goToMain];
}


- (void)goToMain
{
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:WINDOW_ROOTVIEWCONTROLLER_NEEDCHANGE object:nil];
    // self.window.rootViewController = self.viewController;
}

-(void)setTextFieldLeftPadding:(UITextField *)textField forWidth:(CGFloat)leftWidth
{
    CGRect frame = textField.frame;
    frame.size.width = leftWidth;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftview;
}

-(void)commenLogin
{
    [self.view endEditing:YES];
    if([self stringIsEmpty:_textFieldAccount.text]){
        self.bt = [BBGToast makeText:@"帐号不能为空"];
        [self.bt showWithType:ShortTime];
        return;
    }
    if([self stringIsEmpty:_textFieldPsw.text]){
        self.bt = [BBGToast makeText:@"密码不能为空"];
        [self.bt showWithType:ShortTime];
        return;
    }
    
    NSDictionary *dataDc =@{@"cercodeKey":@"bbg-cercode",@"cercodeValue":uuidKey,@"passwd":_textFieldPsw.text,@"username":_textFieldAccount.text};
    NSDictionary *data =@{@"data":[self setParams:dataDc]};
    NSLog(@"%@",data);
    __weak BBGLoginController *weakSelf = self;
    [AFNHelper post:userCommenLogin parameters:data success:^(id responseObject) {
        
         CommenLoginModel *model = [[CommenLoginModel alloc] initWithDictionary:responseObject error:nil];
        if(model.code == 3){//login success
            [weakSelf getLoginInfo:model.data.uId];
        }else{
            weakSelf.bt = [BBGToast makeText:model.message];
            [weakSelf.bt showWithType:ShortTime];
        }
    } faliure:^(id error) {
        weakSelf.bt = [BBGToast makeText:@"网络请求失败，请检查网络后重试"];
        [weakSelf.bt showWithType:ShortTime];
    }];
}

-(void)getLoginInfo:(NSString*)uid
{
    NSDictionary *data =@{@"uid":uid};
//    NSDictionary *data = @{@"data":[self setParams:dataDc]};
    NSLog(@"%@",data);
    //前面写服务器给的域名,后面拼接上需要提交的参数，假如参数是key＝1
    __weak BBGLoginController *weakSelf = self;
    [AFNHelper get:merchantLogin parameters:data success:^(id responseObject) {
        GetMerchantInfoModel *dataModel = [[GetMerchantInfoModel alloc]initWithDictionary:responseObject error:nil];
        if(dataModel.code == 22){
            weakSelf.bt = [BBGToast makeText:dataModel.message];
            [weakSelf.bt showWithType:ShortTime];
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:@"isLogin" forKey:@"isLogin"];
            [user setObject:dataModel.data.sid forKey:@"sbid"];
            [user synchronize];
            [weakSelf goToMain];
            //此处跳转到首页
            
        }else {
            weakSelf.bt = [BBGToast makeText:dataModel.message];
            [weakSelf.bt showWithType:ShortTime];
        }
        
    } faliure:^(id error) {
        weakSelf.bt = [BBGToast makeText:@"网络请求失败，请检查网络后重试"];
        [weakSelf.bt showWithType:ShortTime];
    }];
}

//判断字符串是否为空
-(BOOL)stringIsEmpty:(NSString*)string{
    if(string!=nil&&[string length]>0){//不为空并且长度大于零
        return NO;
    }
    return YES;
}

@end
