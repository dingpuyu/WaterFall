//
//  WaterFallContentView.h
//  UICollectionView瀑布流尝试
//
//  Created by xiaotei on 15/8/26.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterFallContentView : UIView

@property (nonatomic,weak)UICollectionView* collectionView;
//列数
@property (nonatomic,assign)int pictureRow;
//每一行之间的间距
@property (nonatomic,assign)int spacing;

@property (nonatomic,strong)NSArray* picturesArray;

+(instancetype)waterFallContentView;
-(instancetype)initWaterFallContentView;
@end
