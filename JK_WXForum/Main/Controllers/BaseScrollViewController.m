//
//  BaseScrollViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/1.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "BaseScrollViewController.h"
#define  Font(size) [UIFont systemFontOfSize:size]
static NSString *const ID = @"cell";
static NSString *const CollectionID = @"COLLECTION";

@interface BaseScrollViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
//标题视图
@property (nonatomic ,strong) UIScrollView * topTitleView;
//标题按钮
@property (nonatomic ,strong) UIButton * titleButton;
//内容
@property (nonatomic ,strong) UICollectionView * Collection;
//按钮宽度
@property (nonatomic ,assign) CGFloat MYwidth;
//标题下标
@property (nonatomic ,strong) UIView * underLine;
//保存按钮的数组
@property (nonatomic ,strong) NSMutableArray * buttons;
//字体大小
@property (nonatomic ,assign) CGFloat fontSize;
//下标高度
@property (nonatomic ,assign) CGFloat  underLineH;
//判断有没有搜索View
@property (nonatomic ,assign) BOOL isSearchView;
@end

@implementation BaseScrollViewController

//保存标题数组
-(NSMutableArray *)buttons
{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
        
    }
    return _buttons;
}

//下标
-(UIView *)underLine
{
    if (_underLine == nil) {
        _underLine = [[UIView alloc]init];
        _underLine.backgroundColor = JKColor_RGB(41, 190, 156);
        [self.topTitleView addSubview:_underLine];
    }
    return _underLine;
}




- (void)onceParameterConfig:(void(^)(CGFloat *fontSize,CGFloat *underLineHeight,CGFloat *number,BOOL * isSearchView))textAttriAndUnderSize  setupAllController:(void(^)()) setupAllChildController
{
    CGFloat fontSize = 15;
    CGFloat underLineHeight = 2;
    CGFloat number = 5;
    BOOL isSearchView;
    
    if (textAttriAndUnderSize) {
        textAttriAndUnderSize(&fontSize,&underLineHeight,&number,&isSearchView);
        if (fontSize) {
            _fontSize = fontSize;
        }
        
        if (underLineHeight) {
            _underLineH = underLineHeight;
        }
        if (number) {
            _MYwidth = (JKScreenW / number);
        }
        if (isSearchView) {
            _isSearchView = isSearchView;
        }
        
    }else{
        self.MYwidth = JKScreenW /5;
    }
    
    
    if (setupAllChildController) {
        [self setupAllChildController:setupAllChildController];
    }
    
    
    [self setupCollectionView];
    //加载搜索栏
    [self setupSearchView];
    //加载标题栏
    [self setupScrollViewWhitTiteleView];
    //默认的值
    [self setupAllTitleButton:15 underLineHeight:2];
    
    self.title = @"测试";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}


- (void)setupAllTitleButton:(CGFloat)fontSize underLineHeight:(CGFloat)underLineHeight
{
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW =_MYwidth;
    CGFloat btnH = _topTitleView.jk_height;
    //遍历标题
    for (int i =0; i < self.childViewControllers.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag =i;
        btnX = btnW *i;
        btn.titleLabel.font = self.fontSize==0?Font(fontSize):Font(_fontSize);
        
        btn.frame =CGRectMake(btnX, btnY, btnW, btnH);
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:JKColor_RGB(41, 190, 156) forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(DidClickControllerTransition:) forControlEvents:UIControlEventTouchUpInside];
        [_topTitleView addSubview:btn];
        [self.buttons addObject:btn];
        
        if (i ==0) {
            
            [btn.titleLabel sizeToFit];
            [self DidClickControllerTransition:btn];
            //下标的粗度
            CGFloat h = self.underLineH==0?underLineHeight:self.underLineH;
            self.underLine.jk_height =h;
            self.underLine.jk_y =_topTitleView.jk_height -h;
            self.underLine.jk_width = btn.jk_width;
            self.underLine.centerX = btn.centerX;
            
        }
    }
    
}

//加载搜索栏
- (void)setupSearchView
{
    if (_isSearchView ==NO) return;
    
    CGFloat y = self.navigationController && self.navigationController.navigationBarHidden == NO ? 64:20;
    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, y, JKScreenW, 50)];
    _searchBar = search;
    [self.view addSubview:search];
}


//加载标题栏
- (void)setupScrollViewWhitTiteleView
{
    UIScrollView *topTtitleVie = [[UIScrollView alloc]init];
    CGFloat y =_isSearchView?CGRectGetMaxY(_searchBar.frame):CGRectGetMaxY(self.navigationController.navigationBar.frame);
    topTtitleVie.frame =CGRectMake(0, y, JKScreenW, 44);
    topTtitleVie.backgroundColor = JKColor_RGB(240, 255, 255);;
    topTtitleVie.contentSize =CGSizeMake(self.childViewControllers.count *_MYwidth, topTtitleVie.jk_height);
    topTtitleVie.pagingEnabled =YES;
    topTtitleVie.showsHorizontalScrollIndicator =NO;
    _topTitleView = topTtitleVie;
    [self.view addSubview:topTtitleVie];
    
}

//切换控制器
-(void)DidClickControllerTransition:(UIButton *)btn
{
    _titleButton.selected = NO;
    btn.selected = YES;
    _titleButton =btn;
    _Collection.contentOffset =CGPointMake(btn.tag * JKScreenW, 0);
    [UIView animateWithDuration:0.5 animations:^{
        
        self.underLine.jk_width = btn.jk_width;
        self.underLine.centerX =btn.centerX;
        
    }];
    
    [self scrollViewOffset:btn];
    
}


- (void)scrollViewOffset:(UIButton *)btn
{
    CGFloat offsetX = btn.center.x - JKScreenW * 0.5;
    
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    // 计算下最大的标题视图滚动区域
    CGFloat maxOffsetX = self.topTitleView.contentSize.width - JKScreenW ;
    
    if (maxOffsetX < 0) {
        maxOffsetX = 0;
    }
    
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    
    // 滚动区域
    [self.topTitleView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSInteger index = scrollView.contentOffset.x / JKScreenW;
    
    UIButton *button = self.buttons[index];
    
    [self DidClickControllerTransition:button];
}

//添加所有控制器
- (void)setupAllChildController:(void(^)())setupAllChildController
{
    setupAllChildController();
}



- (void)setupCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(WIDTH(self.view), HEIGHT(self.view));
    
    
    
    UICollectionView * Collection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    Collection.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    Collection.pagingEnabled =YES;
    Collection.delegate = self;
    Collection.dataSource = self;
    Collection.bounces = NO;
    _Collection =Collection;
    [Collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CollectionID];
    [self.view addSubview:Collection];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.childViewControllers.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionID forIndexPath:indexPath];
    //移除之前的view
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIViewController *child = self.childViewControllers[indexPath.row];
    
    if ([child isKindOfClass:[UITableViewController class]]) {
        
        UITableViewController *vc = (UITableViewController*)child;
        vc.view.frame =cell.bounds;
        vc.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(_topTitleView.frame), 0, self.tabBarController&&self.tabBarController.tabBar.hidden == NO?49:0, 0);
    }else{
        child.view.frame =CGRectMake(0, CGRectGetMinY(_topTitleView.frame), JKScreenW, JKScreenH-child.view.jk_y);
    }
    
    [cell.contentView addSubview:child.view];
    
    return cell;
}


@end
