//
//  UIScrollView+HQMJRefresh.h
//  MVVMDemo
//
//  Created by qiang on 2019/2/20.
//  Copyright © 2019 qiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (HQRefresh)
- (void)hq_addHeaderRefreshControlWithCallBack:(dispatch_block_t)callBack;
- (void)hq_addFoorterRefreshControlWithCallBack:(dispatch_block_t)callBack;
@end

NS_ASSUME_NONNULL_END
