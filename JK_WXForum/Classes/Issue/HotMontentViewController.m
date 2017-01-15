//
//  HotMontentViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "HotMontentViewController.h"
#import "IssueRequest.h"
@interface HotMontentViewController ()

@end

@implementation HotMontentViewController


-(instancetype)init {
    self.title = @"热门";
    return [super init];
}
- (void)loadAllData {
    [self.issueRequest loadIssueHotDataSourceHandleCompleteBlock:^{
        [self.tableView reloadData];
    }];
}
@end
