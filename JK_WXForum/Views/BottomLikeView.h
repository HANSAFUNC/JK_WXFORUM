//
//  BottomLikeView.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IssueModel;
@interface BottomLikeView : UIView
@property (nonatomic ,strong) IssueModel * issueItem;
+ (instancetype)viewForXib;
@end
