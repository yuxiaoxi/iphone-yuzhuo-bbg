
//
//  BBGAppDelegate.m
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/22.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import "BBGPrefixHeader.pch"

@interface BBGAppDelegate ()<RDVTabBarControllerDelegate,UIScrollViewDelegate,UITabBarControllerDelegate>

@end



@implementation BBGAppDelegate (RootController)


- (void)setRootViewController
{
    //设置广播监听器
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowRootViewControllerChange) name:WINDOW_ROOTVIEWCONTROLLER_NEEDCHANGE object:nil];
    [self p_finishLaunchingJump];
}

- (void)p_finishLaunchingJump{
    
    if ([SZUserDefault objectForKey:@"isLogin"]&& [[SZUserDefault objectForKey:@"isLogin"] isEqualToString:@"isLogin"])
    {//已经登录了
        [self setRoot];
    }
    else
    {//没有登录
        BBGLoginController *loginController = [[ BBGLoginController alloc ]init ];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginController];
        [self changeRootViewController:navController];

    }

}

- (void)windowRootViewControllerChange
{
    [self p_finishLaunchingJump];
}

- (void)changeRootViewController:(UIViewController *)aRootViewController
{
    [self.navigationController popToRootViewControllerAnimated:NO];
    self.navigationController = (UINavigationController *)aRootViewController;
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
}

- (void)setRoot
{
    
    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    navc.navigationBar.barTintColor = [UIColor nvColorWithff9933];
    navc.navigationBar.shadowImage = [[UIImage alloc] init];
    [navc.navigationBar setTranslucent:NO];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [navc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    navc.navigationBar.tintColor = [UIColor whiteColor];
    [self changeRootViewController:navc];
//    self.window.rootViewController = navc;
}


#pragma mark - Windows
- (void)setTabbarController
{
    OrderListController *orderList = [[OrderListController alloc]init];
    ProductListController *productList  = [[ProductListController alloc]init];
    MessageRecordController *messageRecord  = [[MessageRecordController alloc]init];
    SelfCenterController *selfCenter = [SelfCenterController new];
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[orderList,productList,messageRecord,selfCenter]];
    self.viewController = tabBarController;
    tabBarController.delegate = self;
    tabBarController.navigationItem.title = @"订单";
    [self customizeTabBarForController:tabBarController];
}

- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[OrderListController class]])
    {
        tabBarController.navigationItem.title = @"订单";
    }
    if ([viewController isKindOfClass:[ProductListController class]])
    {
        tabBarController.navigationItem.title = @"商品";
    }
    if ([viewController isKindOfClass:[MessageRecordController class]])
    {
        tabBarController.navigationItem.title = @"留言";
    }
    if ([viewController isKindOfClass:[SelfCenterController class]])
    {
        tabBarController.navigationItem.title = @"个人中心";
    }
   
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
{

    UIImage *finishedImage = [self createImageWithColor:[UIColor whiteColor]];
    UIImage *unfinishedImage = [self createImageWithColor:[UIColor whiteColor]];
    
    
    NSArray *tabBarItemImages = @[@"tpo_tab_home",@"tpo_tab_found",@"tab_children",@"tpo_tab_course",@"tpo_tab_user"];
    NSArray *selectedImages = @[@"tpo_tab_home_pre",@"tpo_tab_found_pre",@"tab_children_pre",@"tpo_tab_course_pre",@"tpo_tab_user_pre"];
    
    NSInteger index = 0;
    [[tabBarController tabBar] setTranslucent:YES];
    for (RDVTabBarItem *item in [[tabBarController tabBar] items])
    {
        
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[selectedImages objectAtIndex:index]];
        UIImage *unselectedimage = [UIImage imageNamed:[tabBarItemImages objectAtIndex:index]];
        //        item.imagePositionAdjustment = UIOffsetMake(0, -5);
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        NSDictionary *unseleAtrr = @{
                                     NSFontAttributeName: [UIFont systemFontOfSize:11],
                                     NSForegroundColorAttributeName: [UIColor nvColorWithcccccc],
                                     };
        NSDictionary *seleAtrr = @{
                                   NSFontAttributeName: [UIFont systemFontOfSize:11],
                                   NSForegroundColorAttributeName: [UIColor nvColorWithff9933],
                                   };
        [item setUnselectedTitleAttributes:unseleAtrr];
        [item setSelectedTitleAttributes:seleAtrr];
        
        [item setTitle:@[@"订单",@"商品",@"留言",@"个人中心"][index]];
        index++;
    }
}
- (void)setAppWindows
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
//    [[UIApplication sharedApplication]setStatusBarHidden:NO];
//    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}



@end
