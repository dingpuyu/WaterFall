//
//  LDWaterFallLayout.h
//  UICollectionView瀑布流尝试
//
//  Created by xiaotei on 15/8/27.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LDWaterFallLayout;

@protocol LDWaterFallLayoutDelegate <UICollectionViewDelegateFlowLayout>

//协议方法获得item的高度
-(CGFloat)waterFallLayout:(LDWaterFallLayout*)waterLayout getItemHeightWith:(NSIndexPath*)indexPath andItemWidth:(NSInteger)itemWidth;

-(void)waterFallLayout:(LDWaterFallLayout*)waterLayout reloadViewsSize:(NSArray*)sizeArray;

@end

@interface LDWaterFallLayout : UICollectionViewFlowLayout
//列数
@property (nonatomic,assign)int numberOfRow;
//列边距
@property (nonatomic,assign)int rowMargin;
//行边距
@property (nonatomic,assign)int colMargin;
//四周边距
@property (nonatomic,assign)UIEdgeInsets edgeinsets;

@property (nonatomic,weak)id<LDWaterFallLayoutDelegate> delegate;
@end
