//
//  MomentsCell.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/1.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "MomentsCell.h"
#import "IssueModel.h"
#import "TopHalfView.h"
#import "MidImageView.h"
#import "BottomLikeView.h"

@interface MomentsCell ()
{
    TopHalfView * _topView;
    MidImageView * _midView;
    BottomLikeView * _bottom;
}
@end

@implementation MomentsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        TopHalfView * topView = [TopHalfView viewForXib];
        _topView = topView;
        [self.contentView addSubview:topView];
        MidImageView * midView = [[MidImageView alloc]init];
        _midView = midView;
        [self.contentView addSubview:midView];
        
        BottomLikeView * bottom = [BottomLikeView viewForXib];
        _bottom = bottom;
        [self.contentView addSubview:bottom];
        
        
    }
    return self;
}

-(void)setIssueItem:(IssueModel *)issueItem {
    _issueItem = issueItem;
    _topView.issueItem = issueItem;
    _topView.frame = issueItem.topViewFrame;
    _topView.issueItem = issueItem;
    
    if (issueItem.imagelist.count) {
        _midView.frame = issueItem.midImageFrame;
        _midView.hidden = NO;
        _midView.images = issueItem.imagelist;
    }else {
        _midView.hidden = YES;
    }
    
    _bottom.frame = issueItem.bottomViewFrame;
    _bottom.issueItem = issueItem;
    
    
}

@end
