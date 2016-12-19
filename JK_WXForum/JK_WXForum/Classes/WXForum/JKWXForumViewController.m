//
//  JKWXForumViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/19.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKWXForumViewController.h"


@interface JKWXForumViewController ()

@end

@implementation JKWXForumViewController

-(instancetype)init
{
    self.title = @"无邪论坛";
    return  [super init];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [super setupBarButtonItemType:0 normalImage:[UIImage imageNamed:@"search_icon"] hightLightImage:nil addTarget:self action:@selector(pushSearchViewController)];
    [super setupBarButtonItemType:1 normalImage:[UIImage imageNamed:@"签到"] hightLightImage:nil addTarget:self action:@selector(signInFadeShowSignView)];
    
}

- (void)pushSearchViewController{
  
    NSLog(@"跳转查找控制器");
}

- (void)signInFadeShowSignView {
    NSLog(@"弹出签到遮盖");
}




@end
