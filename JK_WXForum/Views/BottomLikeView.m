//
//  BottomLikeView.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "BottomLikeView.h"
#import "IssueModel.h"

@interface BottomLikeView ()

@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentNum;

@end
@implementation BottomLikeView

-(void)setIssueItem:(IssueModel *)issueItem {
    _issueItem = issueItem;
    [_likeButton setTitle:issueItem.likenum forState:0];
    [_commentNum setTitle:issueItem.replynum forState:0];
    
}
+ (instancetype)viewForXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

@end
