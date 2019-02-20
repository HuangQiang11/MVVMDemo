//
//  HQHomeVC.m
//  MVVMDemo
//
//  Created by qiang on 2019/2/19.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQHomeVC.h"
#import "HQHomeDataController.h"
#import "HQHomeCollectionView.h"
@interface HQHomeVC ()<HQHomeCollectionViewRefreshDelegate,HQHomeCollectionViewDelegate>
@property (nonatomic, strong) HQHomeDataController * dataController;
@property (nonatomic, strong) HQHomeCollectionView * homeCollectionView;
@end

@implementation HQHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hq_setUpLayout];
    [self hq_loadData];
}

#pragma mark - layout
- (void)hq_setUpLayout{
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.homeCollectionView];
    [_homeCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)hq_refreshLayout{
    HQHomeViewModel * viewModel = [HQHomeViewModel hq_viewModelWithModel:self.dataController.dataSource];
    [_homeCollectionView hq_bindDataWithViewModel:viewModel];
}

#pragma mark - loadData
- (void)hq_loadData{
    if (self.dataController.dataSource.count == 0) {
        [SVProgressHUD showWithStatus:@"加载数据中。。。"];
    }
    [self.dataController hq_requestDataSourceWithCallback:^(NSError * _Nonnull error) {
        if (!error) {
            [self hq_refreshLayout];
        }
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - HQHomeCollectionViewRefreshDelegate
- (void)hq_footerRefreshDataWithCompletion:(dispatch_block_t)completion{
    [self.dataController hq_requestMoreDataWithCallback:^(NSError * _Nonnull error) {
        if (!error) {
            [self hq_refreshLayout];
        }
        completion?completion():nil;
    }];
}

- (void)hq_headerRefreshDataWithCompletion:(dispatch_block_t)completion{
    [self.dataController hq_requestDataSourceWithCallback:^(NSError * _Nonnull error) {
        if (!error) {
            [self hq_refreshLayout];
        }
        completion?completion():nil;
    }];
}

#pragma mark - HQHomeCollectionViewDelegate
- (void)hq_homeCollectionViewDidSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击事件");
}

- (void)hq_homeCollectionViewwillDisplayCellforItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"展示事件");
}

#pragma mark - setting getting
- (HQHomeDataController *)dataController{
    if (!_dataController) {
        _dataController = [[HQHomeDataController alloc] init];
    }
    return _dataController;
}

- (HQHomeCollectionView *)homeCollectionView{
    if (!_homeCollectionView) {
        _homeCollectionView = [[HQHomeCollectionView alloc] init];
        _homeCollectionView.refreshDelegate = self;
        _homeCollectionView.delegate = self;
    }
    return _homeCollectionView;
}



@end
