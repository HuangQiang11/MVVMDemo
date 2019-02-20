//
//  HQHomeViewModel.h
//  MVVMDemo
//
//  Created by qiang on 2019/2/19.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQBaseViewModel.h"
#import "HQHomeCellViewModel.h"
#import "HQHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HQHomeViewModel : HQBaseViewModel
@property (nonatomic, strong) NSMutableArray <HQHomeCellViewModel *>*cellViewModels;
+ (HQHomeViewModel *)hq_viewModelWithModel:(NSArray<HQHomeModel *>*)models;
@end

NS_ASSUME_NONNULL_END
