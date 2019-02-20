//
//  HQHomeCollectionView.m
//  MVVMDemo
//
//  Created by qiang on 2019/2/19.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQHomeCollectionView.h"
#import "HQFuntion.h"
#import "UIScrollView+HQMJRefresh.h"
@interface HQHomeCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@end

@implementation HQHomeCollectionView
- (void)hq_bindDataWithViewModel:(HQHomeViewModel *)viewModel{
    self.viewModel = viewModel;
    [_collectionView reloadData];
    if (!_collectionView.mj_footer) {
        __WEAK_SELF_YLSLIDE
        [_collectionView hq_addFoorterRefreshControlWithCallBack:^{
            [weakSelf hq_footerRefresh];
        }];
    }
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self hq_setUpLayout];
    }
    return self;
}

- (void)hq_setUpLayout{
    
    UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = [HQHOmeCollectionViewCell hq_cellSize];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_collectionView registerClass:[HQHOmeCollectionViewCell class] forCellWithReuseIdentifier:[HQHOmeCollectionViewCell hq_cellReuseIdentify]];
    
    __WEAK_SELF_YLSLIDE
    [_collectionView hq_addHeaderRefreshControlWithCallBack:^{
        [weakSelf hq_headerRefresh];
    }];
}

- (void)hq_headerRefresh{
    if (self.refreshDelegate && [self.refreshDelegate respondsToSelector:@selector(hq_headerRefreshDataWithCompletion:)]) {
        [self.refreshDelegate hq_headerRefreshDataWithCompletion:^{
            [self.collectionView.mj_header endRefreshing];
        }];
    }
}

- (void)hq_footerRefresh{
    if (self.refreshDelegate && [self.refreshDelegate respondsToSelector:@selector(hq_footerRefreshDataWithCompletion:)]) {
        [self.refreshDelegate hq_footerRefreshDataWithCompletion:^{
            [self.collectionView.mj_footer endRefreshing];
        }];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.cellViewModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HQHOmeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:[HQHOmeCollectionViewCell hq_cellReuseIdentify] forIndexPath:indexPath];
    cell.cellViewModel = self.viewModel.cellViewModels[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(hq_homeCollectionViewDidSelectItemAtIndexPath:)]) {
        [self.delegate hq_homeCollectionViewDidSelectItemAtIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(hq_homeCollectionViewwillDisplayCellforItemAtIndexPath:)]) {
        [self.delegate hq_homeCollectionViewwillDisplayCellforItemAtIndexPath:indexPath];
    }

}

@end

@implementation HQHOmeCollectionViewCell
+ (CGSize)hq_cellSize{
    return CGSizeMake(kScreenWidth, 100);
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self hq_setUpLayout];
    }
    return self;
}

- (void)hq_setUpLayout{
    self.backgroundColor = [UIColor yellowColor];
    
    _titleLabel = [UILabel new];
    _titleLabel.textColor = [UIColor redColor];
    _titleLabel.font = [UIFont systemFontOfSize:17];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


- (void)setCellViewModel:(HQHomeCellViewModel *)cellViewModel{
    _cellViewModel = cellViewModel;
    _titleLabel.text = _cellViewModel.title;
}

@end
