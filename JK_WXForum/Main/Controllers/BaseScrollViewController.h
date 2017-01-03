//
//  BaseScrollViewController.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/1.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseScrollViewController : UIViewController
//搜索view 自行修改
@property (nonatomic ,strong) UISearchBar * searchBar;

- (void)onceParameterConfig:(void(^)(CGFloat *fontSize,CGFloat *underLineHeight,CGFloat *number,BOOL * isSearchView))textAttriAndUnderSize  setupAllController:(void(^)())setupAllChildController;

@end
