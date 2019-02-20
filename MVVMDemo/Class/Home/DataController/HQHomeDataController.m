//
//  HQHomeDataController.m
//  MVVMDemo
//
//  Created by qiang on 2019/2/19.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQHomeDataController.h"

@implementation HQHomeDataController
- (void)hq_requestDataSourceWithCallback:(void(^)(NSError * error))callback{
    _currentPage = 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray * arr = @[
                          @"1",
                          @"2",
                          @"3",
                          @"4",
                          @"5"
                          ];
        [self.dataSource removeAllObjects];
        for (NSString * str in arr) {
            HQHomeModel * homeModel = [HQHomeModel new];
            homeModel.name = str;
            [self.dataSource addObject:homeModel];
        }
        callback?callback(nil):nil;
    });
}

- (void)hq_requestMoreDataWithCallback:(void(^)(NSError * error))callback{
    ++_currentPage;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray * arr = @[
                          @"1",
                          @"2",
                          @"3",
                          @"4",
                          @"5"
                          ];
        for (NSString * str in arr) {
            HQHomeModel * homeModel = [HQHomeModel new];
            homeModel.name = [NSString stringWithFormat:@"%ld%@",self.currentPage,str];
            [self.dataSource addObject:homeModel];
        }
        callback?callback(nil):nil;
    });
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
@end
