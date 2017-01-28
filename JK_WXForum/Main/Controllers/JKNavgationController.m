//
//  JKNavgationController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKNavgationController.h"
#import "UIImage+Color.h"


@implementation JKNavgationController


+(void)load{
    
    UIImage * bgImage = [UIImage imageWithColor:JKColor_RGB(41, 190, 156)];
    
    UINavigationBar * appearance = [UINavigationBar appearanceWhenContainedIn:[self class],nil];
    [appearance setShadowImage:[[UIImage alloc]init]];
    
    //        [appearance setBackgroundImage:barImage forBarMetrics:0];
    
    [appearance setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    //    [[UINavigationBar appearance] setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    [appearance setTintColor:JKColor_RGB(255, 255, 255)];
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated {
    NSLog(@"%ld",self.childViewControllers.count);
    if (self.childViewControllers.count ==2) {
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
        UIViewController * vc = [super popViewControllerAnimated:animated];
        UIImage * bgImage = [UIImage imageWithColor:JKColor_RGB(41, 190, 156)];
        [vc.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        return vc;
    }
    return  [super popViewControllerAnimated:animated];
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isKindOfClass:NSClassFromString(@"BaseWebViewController")]) {
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationController.toolbar.backgroundColor = JKColor_RGB(234, 23, 213);
    }
    [super pushViewController:viewController animated:animated];
}

@end
