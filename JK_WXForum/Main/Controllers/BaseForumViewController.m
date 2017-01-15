//
//  BaseForumViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/5.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "BaseForumViewController.h"
#import "ForumSubCell.h"
static NSString * const ForumCellIdentifier = @"ForumCellIdentifier";
@interface BaseForumViewController ()

@end

@implementation BaseForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ForumSubCell class] forCellReuseIdentifier:ForumCellIdentifier];
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(64 + 44, 0, 49, 0);
    [self loadAllData];
    
}

- (void)loadAllData {}

#pragma mark - Table view data source


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    return self.issueRequest.issueModels.count;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ForumSubCell *cell = [tableView dequeueReusableCellWithIdentifier:ForumCellIdentifier forIndexPath:indexPath];
   
    return cell;
}



@end
