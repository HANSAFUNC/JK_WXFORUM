//
//  BaseViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "BaseViewController.h"
#import "UIButton+buttonItem.h"


@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setupBarButtonItemType:(UICustomtype)type normalImage:(UIImage *)image hightLightImage:(UIImage *)hightimage addTarget:(id)Target action:(SEL)action;
{
    UIButton * searchBtn = [UIButton buttonWithImage:image hightLightImage:hightimage addTarget:Target action:action];
    UIView * view = [[UIView alloc]initWithFrame:searchBtn.bounds];
    [view addSubview:searchBtn];
    if (type == UICustomtypeLeft) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    }else {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    }
    
}
@end
