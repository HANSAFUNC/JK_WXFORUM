//
//  BaseViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "BaseViewController.h"
#import "UIButton+buttonItem.h"
#import "JKGeneralCell.h"
#import "GeneralModel.h"

static NSString * const generalCellID = @"kGeneralID";
@implementation BaseViewController

-(void)viewDidLoad {
    [self setupUI];
    [self loadAllData];
    [super viewDidLoad];
}

- (void)loadAllData{}

- (void)setupUI {
    [self setupTableView];
    [self setupStatuBar];
}

- (void)setupStatuBar {
    UIView * view =[[UIView alloc]init];
    view.backgroundColor = JKColor_RGB(41, 190, 156);
    view.frame = CGRectMake(0, 0, JKSreenW, 20);
    [self.view insertSubview:view atIndex:1];
}
- (void)setupTableView{
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [tableView registerNib:[UINib nibWithNibName:@"JKGeneralCell" bundle:nil] forCellReuseIdentifier:generalCellID];
    _tableView = tableView;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.generalModels.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JKGeneralCell * cell = [tableView dequeueReusableCellWithIdentifier:generalCellID forIndexPath:indexPath];
    cell.generalModel = self.generalModels[indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    GeneralModel * model = self.generalModels[indexPath.row];
    return model.cellH;
}

- (void)setupBarButtonItemType:(UICustomType)type normalImage:(UIImage *)image hightLightImage:(UIImage *)hightimage addTarget:(id)Target action:(SEL)action;
{
    UIButton * searchBtn = [UIButton buttonWithImage:image hightLightImage:hightimage addTarget:Target action:action];
    UIView * view = [[UIView alloc]initWithFrame:searchBtn.bounds];
    [view addSubview:searchBtn];
    if (type == UICustomtypeLeft) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    }else {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    }
    
}
@end
