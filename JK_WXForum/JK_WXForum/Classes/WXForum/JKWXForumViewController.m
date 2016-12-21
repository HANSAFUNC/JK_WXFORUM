//
//  JKWXForumViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/19.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKWXForumViewController.h"
#import "JKCustomButton.h"
#import "GeneralRequestVM.h"
#import "JKGeneralCell.h"
#import "OnLineoffLineView.h"

const static CGFloat kNavgationHeight = 30;
const static CGFloat kContentViewHeight = 61;
const static CGFloat kOnlineViewHeight = 80;
static NSString * const generalCellID = @"kGeneralID";
@interface JKWXForumViewController () <UITableViewDataSource>
@property (nonatomic ,strong) UIView * contentView;
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) GeneralRequestVM * GeneralVm;

@end


@implementation JKWXForumViewController


-(instancetype)init
{
    _GeneralVm = [[GeneralRequestVM alloc]init];
    self.title = @"无邪论坛";
    return  [super init];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadAllData];
    
}

- (void)setupUI {
    [self setupBarButtonItemView];
    [self setupTableView];
    [self setupOnlineView];
}

- (void)setupBarButtonItemView {
    [super setupBarButtonItemType:0 normalImage:[UIImage imageNamed:@"search_icon"] hightLightImage:nil addTarget:self action:@selector(pushSearchViewController)];
    [super setupBarButtonItemType:1 normalImage:[UIImage imageNamed:@"签到"] hightLightImage:nil addTarget:self action:@selector(signInFadeShowSignView)];
}

- (void)loadAllData {
    [self.GeneralVm loadGeneralDataFinshedCallBack:^{
        [self.tableView reloadData];
        [self setupNavigationView];
        
    }];
    
}

- (void)setupOnlineView {
    OnLineoffLineView * onlineView = [[OnLineoffLineView alloc]init];
    onlineView.frame = CGRectMake(0, -(kContentViewHeight + kOnlineViewHeight), JKSreenW, kOnlineViewHeight);
    onlineView.backgroundColor = JKColor_RGB(240, 255, 255);
    [self.tableView addSubview:onlineView];
}

- (void)setupTableView{
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.rowHeight = 100;
    tableView.contentInset = UIEdgeInsetsMake(kContentViewHeight + kOnlineViewHeight, 0, 0, 0);
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [tableView registerNib:[UINib nibWithNibName:@"JKGeneralCell" bundle:nil] forCellReuseIdentifier:generalCellID];
    _tableView = tableView;
    [self.view addSubview:tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.GeneralVm.GeneralModels.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JKGeneralCell * cell = [tableView dequeueReusableCellWithIdentifier:generalCellID forIndexPath:indexPath];
    cell.generalModel = self.GeneralVm.GeneralModels[indexPath.row];
    
    return cell;
    
}


- (void)setupNavigationView {
    
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = CGRectMake(0, -kContentViewHeight, JKSreenW, kContentViewHeight);
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
        CGFloat w = (JKSreenW - (totalColums * 1)) / totalColums;
        CGFloat x = col * w + col * margin;
        CGFloat y = row * ( h + margin);
        btn.frame = CGRectMake(x, y, w, h);
        [view addSubview:btn];
        
    }
}

- (void)pushSearchViewController{
    
    NSLog(@"跳转查找控制器");
}

- (void)signInFadeShowSignView {
    NSLog(@"弹出签到遮盖");
}




@end
