//
//  HQBaseCollectionViewCell.h
//  MVVMDemo
//
//  Created by qiang on 2019/2/20.
//  Copyright © 2019 qiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HQUIDefine.h"
#import "HQFuntion.h"
NS_ASSUME_NONNULL_BEGIN

@interface HQBaseCollectionViewCell : UICollectionViewCell
+ (NSString *)hq_cellReuseIdentify;
+ (CGSize)hq_cellSize;
@end

NS_ASSUME_NONNULL_END
