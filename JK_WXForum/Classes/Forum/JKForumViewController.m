//
//  JKForumViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/19.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKForumViewController.h"

@interface JKForumViewController ()

@end

@implementation JKForumViewController

-(instancetype)init
{
    self.title = @"论坛";
    return  [super init];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}
- (void)setupUI {
    [self onceParameterConfig:^(CGFloat *fontSize, CGFloat *underLineHeight, CGFloat *number, BOOL *isSearchView, CGFloat *titleHeight) {
        
    } setupAllController:^{
        
    }];
    [self setupStatuBar];
}
- (void)setupStatuBar {
    UIView * view =[[UIView alloc]init];
    view.backgroundColor = JKColor_RGB(41, 190, 156);
    view.frame = CGRectMake(0, 0, JKScreenW, 20);
    [self.view insertSubview:view atIndex:1];
}






@end
