//
//  HQHomeViewModel.m
//  MVVMDemo
//
//  Created by qiang on 2019/2/19.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQHomeViewModel.h"

@implementation HQHomeViewModel
+ (HQHomeViewModel *)hq_viewModelWithModel:(NSArray<HQHomeModel *>*)models{
    HQHomeViewModel * viewModel = [HQHomeViewModel new];
    viewModel.cellViewModels = [NSMutableArray array];
    for (HQHomeModel * model in models) {
        HQHomeCellViewModel * cellViewModel = [HQHomeCellViewModel hq_cellViewModelWithModel:model];
        [viewModel.cellViewModels addObject:cellViewModel];
    }
    return viewModel;
}
@end
