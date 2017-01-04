//
//  AllMontensViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "AllMontensViewController.h"
#import "MomentsCell.h"
#import "IssueRequest.h"
#import "IssueModel.h"

static NSString * const ID = @"MomentsCellIdentifier";
@interface AllMontensViewController ()

@property (nonatomic ,strong) IssueRequest * issueRequest;
@end

@implementation AllMontensViewController

-(IssueRequest *)issueRequest {
    if (!_issueRequest) {
        _issueRequest = [[IssueRequest alloc]init];
    }
    return _issueRequest;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[MomentsCell class] forCellReuseIdentifier:ID];
    [self loadAllData];
    
}

- (void)loadAllData {
    [self.issueRequest loadIssueDataSourceHandleCompleteBlock:^{
        [self.tableView reloadData];
    }];
}

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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
