//
//  HQHomeCellViewModel.h
//  MVVMDemo
//
//  Created by qiang on 2019/2/20.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQBaseViewModel.h"
#import "HQHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HQHomeCellViewModel : HQBaseViewModel
@property (nonatomic, copy) NSString * title;
+ (HQHomeCellViewModel *)hq_cellViewModelWithModel:(HQHomeModel *)model;
@end

NS_ASSUME_NONNULL_END
