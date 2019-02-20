//
//  HQBaseCollectionViewCell.m
//  MVVMDemo
//
//  Created by qiang on 2019/2/20.
//  Copyright © 2019 qiang. All rights reserved.
//

#import "HQBaseCollectionViewCell.h"

@implementation HQBaseCollectionViewCell
+ (NSString *)hq_cellReuseIdentify{
    return NSStringFromClass(self);
}

+ (CGSize)hq_cellSize{
    return CGSizeZero;
}
@end
