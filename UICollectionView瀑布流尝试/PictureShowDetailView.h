//
//  PictureShowDetailView.h
//  UICollectionView瀑布流尝试
//
//  Created by xiaotei on 15/8/27.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureShowDetailView : UIScrollView
//类方法创建图片展示视图对象
+(instancetype)pictureShowDetailViewWithPictureName:(NSString*)pictureName;
@end
