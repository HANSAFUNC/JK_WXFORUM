//
//  BaseMomentViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "BaseMomentViewController.h"
#import "MomentsCell.h"
#import "IssueModel.h"
#import "IssueRequest.h"

static NSString * const ID = @"MomentsCellIdentifier";
@interface BaseMomentViewController ()

@end

@implementation BaseMomentViewController

-(IssueRequest *)issueRequest {
    if (!_issueRequest) {
        _issueRequest = [[IssueRequest alloc]init];
    }
    return _issueRequest;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[MomentsCell class] forCellReuseIdentifier:ID];
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(64 + 44, 0, 49, 0);
    [self loadAllData];
    
}

- (void)loadAllData {}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.issueRequest.issueModels.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MomentsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    IssueModel * model = self.issueRequest.issueModels[indexPath.row];
    cell.issueItem = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    IssueModel * model = self.issueRequest.issueModels[indexPath.row];
    return model.cellH;
}

@end
