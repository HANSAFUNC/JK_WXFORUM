//
//  AllMontensViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "AllMontensViewController.h"
#import "IssueRequest.h"

@interface AllMontensViewController ()

@end

@implementation AllMontensViewController

-(instancetype)init {
    self.title = @"全部";
    return [super init];
}
- (void)loadAllData {
    [self.issueRequest loadIssueAllDataSourceHandleCompleteBlock:^{
        [self.tableView reloadData];
    }];
}

@end
