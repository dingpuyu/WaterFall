//
//  WaterFallCell.m
//  UICollectionView瀑布流尝试
//
//  Created by xiaotei on 15/8/26.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import "WaterFallCell.h"

@interface WaterFallCell()
@property (nonatomic,weak)IBOutlet UIImageView* imageView;
@end

@implementation WaterFallCell

-(void)setImageSize:(CGSize)imageSize{
    UIImage* image = [self scaleToSize:[UIImage imageNamed:self.imgName] size:imageSize];
    self.imageView.image = image;
}

-(void)setImgName:(NSString *)imgName{
    _imgName = imgName;
//    NSString* path = [[NSBundle mainBundle]pathForResource:imgName ofType:nil];
//    self.imageView.image = [UIImage imageWithContentsOfFile:path];
    
}

-(void)setImageName:(NSString *)imageName andSize:(CGSize)imageSize{
    _imgName = imageName;
    _imageSize = imageSize;
//    NSString* path = [[NSBundle mainBundle]pathForResource:self.imgName ofType:nil];
    UIImage* lastImage = [UIImage imageNamed:self.imgName];
    UIImage* image = [self scaleToSize:lastImage size:imageSize];
    self.imageView.image = image;
    
}
//按给定尺寸压缩图片
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

+(instancetype)waterFallCellWith:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath{
    NSString* classObj = NSStringFromClass([self class]);
    
    UINib* nib = [UINib nibWithNibName:classObj bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:classObj];
    
    return [collectionView dequeueReusableCellWithReuseIdentifier:classObj forIndexPath:indexPath];
}
@end
