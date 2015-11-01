//
//  WaterFallContentView.m
//  UICollectionView瀑布流尝试
//
//  Created by xiaotei on 15/8/26.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import "WaterFallContentView.h"
#import "UIView+UIViewFrame.h"
#import "WaterFallCell.h"
#import "LDWaterFallLayout.h"
#import "PictureShowDetailView.h"

#define WaterFallCellKey @"waterfallkey"

@interface WaterFallContentView() <UICollectionViewDataSource,UICollectionViewDelegate,LDWaterFallLayoutDelegate>
@property (nonatomic,strong)NSArray* itemsHeight;

@property (nonatomic,assign)int pictureWidth;

@property (nonatomic,strong)NSArray* picturesSize;

@end

@implementation WaterFallContentView

-(int)pictureWidth{
    if (_pictureWidth == 0) {
        _pictureWidth = 100;
    }
    return _pictureWidth;
}

-(void)setPicturesArray:(NSArray *)picturesArray{
    NSMutableArray* array = [NSMutableArray array];
    _picturesArray = picturesArray;
    for (int i = 0; i < picturesArray.count; i++) {
        NSString* path = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle]resourcePath],picturesArray[i]];
        UIImage* img = [UIImage imageWithContentsOfFile:path];
        //按照当前适当大小计算缩放后尺寸
        CGFloat currentWith = self.pictureWidth;
        CGFloat currentHeight = img.size.height * currentWith/img.size.width;
        CGSize size = CGSizeMake(currentWith, currentHeight);
        [array addObject:NSStringFromCGSize(size)];
    }
    self.picturesSize = array;
}

-(instancetype)initWaterFallContentView{
    if (self = [super init]) {
        LDWaterFallLayout* layout = [[LDWaterFallLayout alloc]init];
        layout.delegate = self;
        layout.numberOfRow = 3;
        layout.rowMargin = 3;
        layout.colMargin = 3;
        
        UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        
        [collectionView registerClass:[WaterFallCell class] forCellWithReuseIdentifier:WaterFallCellKey];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        self.collectionView = collectionView;
        
        [self addSubview:collectionView];
        
    }
    
    return self;
}

+(instancetype)waterFallContentView{
    return [[self alloc]initWaterFallContentView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.picturesArray.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath    {
    int height = [self.itemsHeight[indexPath.row] intValue];
    return CGSizeMake(self.pictureWidth, height);
}
//返回每个collectionviewcell视图
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WaterFallCell* cell = [WaterFallCell waterFallCellWith:collectionView andIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
//    cell.imgName = self.picturesArray[indexPath.row];
//    cell.size = CGSizeFromString(self.picturesSize[indexPath.row]);
    [cell setImageName:self.picturesArray[indexPath.row] andSize:CGSizeFromString(self.picturesSize[indexPath.row])];
    return cell;
}

/**
 *  计算下一个cell frame值
    传入一个cell的size，以便替换之前的短板
 */

/**
 *  在即将加载到父视图时初始化frame
 */
-(void)willMoveToSuperview:(UIView *)newSuperview{
    self.frame = newSuperview.bounds;
    self.collectionView.bounces = NO;
    self.collectionView.frame = newSuperview.bounds;
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

//布局类代理方法，传递存储item的size的数组
-(void)waterFallLayout:(LDWaterFallLayout *)waterLayout reloadViewsSize:(NSArray *)sizeArray{
    self.picturesSize = sizeArray;
}


#pragma mark LDWaterFallLayoutDelegate协议方法
-(CGFloat)waterFallLayout:(LDWaterFallLayout *)waterLayout getItemHeightWith:(NSIndexPath *)indexPath andItemWidth:(NSInteger)itemWidth{
    NSString* path = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle]resourcePath],self.picturesArray[indexPath.row]];
    UIImage* img = [UIImage imageWithContentsOfFile:path];
    //按照当前适当大小计算缩放后尺寸
    CGFloat currentWith = itemWidth;
    CGFloat currentHeight = img.size.height * currentWith/img.size.width;

    return currentHeight;
}

//返回cell与的insets
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}

//返回每行之间的距离
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 0;
//}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
    PictureShowDetailView* showDetail = [PictureShowDetailView pictureShowDetailViewWithPictureName:self.picturesArray[indexPath.row]];
    
    [self addSubview:showDetail];
    
    
    NSLog(@"row:%ld",indexPath.row);
    
}

//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section   {
//    return 0;
//}


@end
