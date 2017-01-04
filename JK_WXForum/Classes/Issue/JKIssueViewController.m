//
//  JKIssueViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/19.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKIssueViewController.h"
#import "AllMontensViewController.h"

@interface JKIssueViewController ()

@end

@implementation JKIssueViewController

-(instancetype)init
{
   self.title = @"吹吹";
    return  [super init];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self onceParameterConfig:^(CGFloat *fontSize, CGFloat *underLineHeight, CGFloat *number, BOOL *isSearchView) {
        *number = 2;
        *isSearchView = NO;
    
    } setupAllController:^{
        AllMontensViewController * vc = [AllMontensViewController new];
        UIViewController * vc1 = [UIViewController new];
        vc.title = @"全部";
        vc1.title = @"热门";
        [self addChildViewController:vc];
        [self addChildViewController:vc1];
        
    }];
    [self setupStatuBar];
    
}

- (void)setupStatuBar {
    UIView * view =[[UIView alloc]init];
    view.backgroundColor = JKColor_RGB(41, 190, 156);
    view.frame = CGRectMake(0, 0, JKScreenW, 20);
    [self.view insertSubview:view atIndex:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
