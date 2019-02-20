//
//  HQHomeCollectionView.h
//  MVVMDemo
//
//  Created by qiang on 2019/2/19.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQBaseView.h"
#import "HQHomeViewModel.h"
#import "HQBaseCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@protocol HQHomeCollectionViewRefreshDelegate <NSObject>

- (void)hq_headerRefreshDataWithCompletion:(dispatch_block_t)completion;
- (void)hq_footerRefreshDataWithCompletion:(dispatch_block_t)completion;

@end

@protocol HQHomeCollectionViewDelegate <NSObject>
@optional
- (void)hq_homeCollectionViewDidSelectItemAtIndexPath:(NSIndexPath *)indexPath;

- (void)hq_homeCollectionViewwillDisplayCellforItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface HQHomeCollectionView : HQBaseView

@property (nonatomic, strong) HQHomeViewModel * viewModel;
@property (nonatomic, weak) id<HQHomeCollectionViewRefreshDelegate>refreshDelegate;
@property (nonatomic, weak) id<HQHomeCollectionViewDelegate> delegate;
- (void)hq_bindDataWithViewModel:(HQHomeViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END

@interface HQHOmeCollectionViewCell : HQBaseCollectionViewCell
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) HQHomeCellViewModel * cellViewModel;
@end
