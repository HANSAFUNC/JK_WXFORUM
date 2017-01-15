//
//  JKWXForumViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/19.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKWXForumViewController.h"
#import "BaseWebViewController.h"
#import "JKCustomButton.h"
#import "GeneralRequestVM.h"
#import "JKGeneralCell.h"
#import "OnLineoffLineView.h"
#import "GeneralModel.h"
#import "MaxCycleView.h"
#import <MJRefresh/MJRefresh.h>
typedef NS_ENUM(NSInteger,SelectTargetFid) {
     //闲言碎语
    SelectTittleTattle = 84,
    
};

const static CGFloat kNavgationHeight = 30;
const static CGFloat kContentViewHeight = 61;
const static CGFloat kOnlineViewHeight = 80;
const static CGFloat kCycleViewHeight = 140;

@interface JKWXForumViewController ()
@property (nonatomic ,strong) UIView * contentView;
@property (nonatomic ,strong) GeneralRequestVM * GeneralVm;
@property (nonatomic ,strong) MaxCycleView * maxCycleView;

@end

@implementation JKWXForumViewController

-(GeneralRequestVM *)GeneralVm {
    if (!_GeneralVm) {
        _GeneralVm = [[GeneralRequestVM alloc]init];
    }
    return _GeneralVm;
}
-(instancetype)init {
    self.title = @"无邪论坛";
    return  [super init];
    
}
- (void)setupUI {
    [super setupUI];
    [self setupBarButtonItemView];
    [self setupOnlineView];
    [self setupMaxCycleView];
    [self setupLibMJRefresh];
    
    
}

- (void)setupBarButtonItemView {
    [super setupBarButtonItemType:0 normalImage:[UIImage imageNamed:@"search_icon"] hightLightImage:nil addTarget:self action:@selector(pushSearchViewController)];
    [super setupBarButtonItemType:1 normalImage:[UIImage imageNamed:@"签到"] hightLightImage:nil addTarget:self action:@selector(signInFadeShowSignView)];
}

- (void)setupLibMJRefresh {
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadAllData)];
    header.automaticallyChangeAlpha = YES;
    header.ignoredScrollViewContentInsetTop = kContentViewHeight + kOnlineViewHeight + kCycleViewHeight;
    self.tableView.mj_header = header;
    
}

- (void)loadAllData {
    self.GeneralVm.GeneralModels = nil;
    [self.GeneralVm loadGeneralDataFinshedCallBack:^{
        [self setupNavigationView];
        self.maxCycleView.maxCycleModels = self.GeneralVm.maxCycleModels;
        self.generalModels = self.GeneralVm.GeneralModels;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        NSLog(@"%@",self.GeneralVm)
        
        
    }];
    
}
- (void)setupMaxCycleView {
    MaxCycleView * cycle = [MaxCycleView loadXib];
    cycle.frame = CGRectMake(0, -(kContentViewHeight + kOnlineViewHeight + kCycleViewHeight), JKScreenW, kCycleViewHeight);
    _maxCycleView = cycle;
    [self.tableView addSubview:cycle];
}

- (void)setupOnlineView {
    OnLineoffLineView * onlineView = [[OnLineoffLineView alloc]init];
    onlineView.frame = CGRectMake(0, -(kContentViewHeight + kOnlineViewHeight), JKScreenW, kOnlineViewHeight);
    onlineView.backgroundColor = JKColor_RGB(240, 255, 255);
    [self.tableView addSubview:onlineView];
}

- (void)setupTableView{
    [super setupTableView];
    self.tableView.contentInset = UIEdgeInsetsMake(kContentViewHeight + kOnlineViewHeight + kCycleViewHeight, 0, 0, 0);
    
}

- (void)setupNavigationView {
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = CGRectMake(0, -kContentViewHeight, JKScreenW, kContentViewHeight);
    [self.tableView addSubview:view];
    int totalColums = 4;
    CGFloat margin = 1;
    CGFloat h = kNavgationHeight;
    for (int i = 0; i < self.GeneralVm.navigationModels.count; i++) {
        JKCustomButton * btn = [JKCustomButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:[NSString stringWithFormat:@"%@",self.GeneralVm.navigationModels[i][@"forumname"]] forState:0];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor grayColor] forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        if (i == 1) {
            [btn setImage:[UIImage imageNamed:@"左2"] forState:0];
        }
        if (i == 4) {
            [btn setImage:[UIImage imageNamed:@"左1"] forState:0];
        }
        if (i == 5) {
            [btn setImage:[UIImage imageNamed:@"左01-1"] forState:0];
        }
        if (i == 6) {
            [btn setImage:[UIImage imageNamed:@"右3"] forState:0];
        }
        if (i == 7) {
            [btn setImage:[UIImage imageNamed:@"右4"] forState:0];
        }
        
        int col = i % totalColums;
        int row = i / totalColums;
        CGFloat w = (JKScreenW - (totalColums * 1)) / totalColums;
        CGFloat x = col * w + col * margin;
        CGFloat y = row * ( h + margin);
        btn.frame = CGRectMake(x, y, w, h);
        
        btn.tag = [self.GeneralVm.navigationModels[i][@"fid"] integerValue];
        [btn addTarget:self action:@selector(jumpToTopicTypeViewController:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        
    }
}



- (void)jumpToTopicTypeViewController:(UIButton *)selectButton {
    switch (selectButton.tag) {
        case 84:
            //闲言碎语
            break;
        case 161:
            //我家小厨
            break;
        case 172:
            //花草萌语
            break;
        case 164:
            //明星梦系
            break;
        case 174:
            //足部地球
            break;
        case 82:
            //网校教务
            break;
        case 127:
            //课程讨论
            break;
        case 49:
            //论坛公告
            break;
    }
    
    NSLog(@"%ld",(long)selectButton.tag);
}
- (void)pushSearchViewController{
    

    NSLog(@"跳转查找控制器");
}

- (void)signInFadeShowSignView {
    NSLog(@"弹出签到遮盖");
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GeneralModel * model = self.generalModels[indexPath.row];
    BaseWebViewController * webViewController = [[BaseWebViewController alloc]init];
    webViewController.generalModel = model;
    [self.navigationController pushViewController:webViewController animated:YES];
    
    
    NSLog(@"%@ %@",model.tid,model.fid);
    
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}


@end
