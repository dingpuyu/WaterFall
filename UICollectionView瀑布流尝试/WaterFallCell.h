//
//  WaterFallCell.h
//  UICollectionView瀑布流尝试
//
//  Created by xiaotei on 15/8/26.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterFallCell : UICollectionViewCell

@property (nonatomic,copy)NSString* imgName;

//图片展示尺寸
@property (nonatomic,assign)CGSize imageSize;



+(instancetype)waterFallCellWith:(UICollectionView*)collectionView andIndexPath:(NSIndexPath*)indexPath;

-(void)setImageName:(NSString*)imageName andSize:(CGSize)imageSize;
@end
