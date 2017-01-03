//
//  MaxCycleView.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/22.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "MaxCycleView.h"
#import "CycleViewCell.h"
static NSString * const CycleViewCellID = @"CycleViewCell";
@interface MaxCycleView () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic ,strong) UICollectionViewFlowLayout * layout;
@property (nonatomic ,strong) NSTimer * timer;

@end

@implementation MaxCycleView


- (void)setMaxCycleModels:(NSArray *)maxCycleModels{
    _maxCycleModels = maxCycleModels;
    _pageControl.numberOfPages = maxCycleModels.count;
    [_collectionView reloadData];
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:maxCycleModels.count * 100 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    [self stopTimer];
    [self startTimer];
}


- (void)startTimer {
    _timer =[NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(scrollToNextImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

- (void)stopTimer {
    [_timer invalidate];
    _timer = nil;
}
- (void)scrollToNextImage {
    CGFloat offsetX = _collectionView.contentOffset.x + JKScreenW;
    [_collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupCollectionView];
    
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = ({
        layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.layout = layout;
        layout;
    });
    
    [_collectionView setPagingEnabled:YES];
    [_collectionView setShowsHorizontalScrollIndicator:NO];
    ;    [_collectionView setCollectionViewLayout:layout];
    [_collectionView registerNib:[UINib nibWithNibName:@"CycleViewCell" bundle:nil] forCellWithReuseIdentifier:CycleViewCellID];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.layout.itemSize = CGSizeMake(WIDTH(self), HEIGHT(self));
    
}

+(instancetype)loadXib {
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.maxCycleModels.count * 1000;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CycleViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CycleViewCellID forIndexPath:indexPath];
    cell.maxCycleModel =self.maxCycleModels[indexPath.row % self.maxCycleModels.count];
    cell.backgroundColor = JKColor_RANDOM;
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x + WIDTH(scrollView) * 0.5;
    NSInteger currentPage = (NSInteger)(offsetX / WIDTH(scrollView)) % self.maxCycleModels.count;
    _pageControl.currentPage = currentPage;
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    [self startTimer];
}



@end
