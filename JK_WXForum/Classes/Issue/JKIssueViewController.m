//
//  JKIssueViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/19.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKIssueViewController.h"
#import "AllMontensViewController.h"
#import "HotMontentViewController.h"

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
    [self setupUI];
}

- (void)setupUI {
    [self onceParameterConfig:^(CGFloat *fontSize, CGFloat *underLineHeight, CGFloat *number, BOOL *isSearchView ,CGFloat * titleHeight) {
        *number = 2;
        *isSearchView = NO;
        *titleHeight = 44;
        
    } setupAllController:^{
        AllMontensViewController * allMontent = [AllMontensViewController new];
        HotMontentViewController * hotMontent = [HotMontentViewController new];
        [self addChildViewController:allMontent];
        [self addChildViewController:hotMontent];
        
    }];
    
}






@end
