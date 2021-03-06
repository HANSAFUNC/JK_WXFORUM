//
//  BaseViewController.h
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UICustomType) {
    UICustomtypeLeft = 0,
    UICustomtypeRight,
    
};

@interface BaseViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) NSArray * generalModels;
- (void)loadAllData;
- (void)setupTableView;
- (void)setupUI;
- (void)setupBarButtonItemType:(UICustomType)type normalImage:(UIImage *)image hightLightImage:(UIImage *)hightimage addTarget:(id)Target action:(SEL)action;
@end
