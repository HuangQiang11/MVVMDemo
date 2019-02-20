//
//  HQHomeCellViewModel.m
//  MVVMDemo
//
//  Created by qiang on 2019/2/20.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQHomeCellViewModel.h"

@implementation HQHomeCellViewModel
+ (HQHomeCellViewModel *)hq_cellViewModelWithModel:(HQHomeModel *)model{
    HQHomeCellViewModel * cellViewModel = [HQHomeCellViewModel new];
    cellViewModel.title = model.name;
    return cellViewModel;
}
@end
