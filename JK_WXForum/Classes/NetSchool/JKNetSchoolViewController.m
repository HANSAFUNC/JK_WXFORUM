//
//  JKNetSchoolViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/26.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKNetSchoolViewController.h"
#import "NetSchoolRequest.h"
#import <MJRefresh/MJRefresh.h>
#import "TopSelectView.h"
const static CGFloat kTopViewHeight = 140;
@interface JKNetSchoolViewController ()
@property (nonatomic ,strong) NetSchoolRequest *netSchoolRequest;

@end
@implementation JKNetSchoolViewController

-(NetSchoolRequest *)netSchoolRequest {
    if (!_netSchoolRequest) {
        _netSchoolRequest = [[NetSchoolRequest alloc]init];
    }
    return _netSchoolRequest;
}
-(instancetype)init{
    self.title = @"无邪网校";
    return  [super init];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    
}
- (void)setupUI {
    [super setupUI];
    [self setupLibMJRefresh];
    [self setupTopSelectView];
    [self setupBarButtonItemView];

   
}
- (void)loadAllData {
    self.netSchoolRequest.netSchoolModels = nil;
    [self.netSchoolRequest loadNetSchoolDataSourceHandleCompleteBlock:^{
        self.generalModels = self.netSchoolRequest.netSchoolModels;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    }];
}

- (void)setupBarButtonItemView {
    [super setupBarButtonItemType:1 normalImage:[UIImage imageNamed:@"pen"] hightLightImage:nil addTarget:self action:@selector(touchUpPublishArticle)];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}
- (void)setupTopSelectView {
    TopSelectView * selectView = [TopSelectView loadXib];
    selectView.frame = CGRectMake(0, 0,JKScreenW, kTopViewHeight);
    selectView.backgroundColor = JKColor_RGB(240, 255, 255);
    self.tableView.contentInset = UIEdgeInsetsMake(kTopViewHeight, 0, 0, 0);
    [self.view addSubview:selectView];
    
}

- (void)setupTableView {
    [super setupTableView];
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(kTopViewHeight, 0, 0, 0);
}
- (void)setupLibMJRefresh {
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadAllData)];
    header.automaticallyChangeAlpha = YES;
    //    header.ignoredScrollViewContentInsetTop = kContentViewHeight + kOnlineViewHeight + kCycleViewHeight;
    [header setBackgroundColor:JKColor_RGB(240, 255, 255)];
    self.tableView.mj_header = header;
    
}

/**
 *  跳到发表吹吹Controller
 */
- (void)touchUpPublishArticle {
    
}

@end
