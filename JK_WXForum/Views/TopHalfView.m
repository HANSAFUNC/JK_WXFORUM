//
//  TopHalfView.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "TopHalfView.h"
#import "IssueModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TopHalfView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *userNameView;
@property (weak, nonatomic) IBOutlet UILabel *dateLineView;
@property (weak, nonatomic) IBOutlet UILabel *contentMessageView;

@end
@implementation TopHalfView


+ (instancetype)viewForXib
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}
-(void)setIssueItem:(IssueModel *)issueItem {
    _issueItem = issueItem;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:issueItem.avatar]];
    _userNameView.text = issueItem.username;
    _dateLineView.text = issueItem.dateline;
    _contentMessageView.text = issueItem.message;
    
}

@end
