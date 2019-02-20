//
//  UIScrollView+HQMJRefresh.m
//  MVVMDemo
//
//  Created by qiang on 2019/2/20.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "UIScrollView+HQMJRefresh.h"

@implementation UIScrollView (HQRefresh)
- (void)hq_addHeaderRefreshControlWithCallBack:(dispatch_block_t)callBack{
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingBlock:callBack];
    self.mj_header = header;
}

- (void)hq_addFoorterRefreshControlWithCallBack:(dispatch_block_t)callBack{
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:callBack];
    self.mj_footer = footer;
}

@end
