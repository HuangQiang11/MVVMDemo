//
//  HQHomeDataController.h
//  MVVMDemo
//
//  Created by qiang on 2019/2/19.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQBaseDataController.h"
#import "HQHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HQHomeDataController : HQBaseDataController
@property (nonatomic, strong) NSMutableArray <HQHomeModel *> *dataSource;
@property (nonatomic, assign) NSInteger currentPage;
- (void)hq_requestDataSourceWithCallback:(void(^)(NSError * error))callback;
- (void)hq_requestMoreDataWithCallback:(void(^)(NSError * error))callback;
@end

NS_ASSUME_NONNULL_END
