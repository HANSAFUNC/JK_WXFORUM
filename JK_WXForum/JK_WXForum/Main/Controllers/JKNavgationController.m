//
//  JKNavgationController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKNavgationController.h"

@implementation JKNavgationController


+(void)load{
    UINavigationBar * bar = [UINavigationBar appearance];
    [bar setBarTintColor:JKColor_RGB(41, 190, 156)];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
}


//-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    
//}

@end
