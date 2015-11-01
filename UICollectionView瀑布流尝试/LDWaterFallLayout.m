//
//  LDWaterFallLayout.m
//  UICollectionView瀑布流尝试
//
//  Created by xiaotei on 15/8/27.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import "LDWaterFallLayout.h"

@interface LDWaterFallLayout()
@property (nonatomic,strong)NSArray* CellsMaxFrame;
@property (nonatomic,strong)NSMutableArray* swapCellsFrame;
@property (nonatomic,assign)CGFloat itemWidth;
@end

@implementation LDWaterFallLayout

-(NSArray *)swapCellsFrame{
    if (_swapCellsFrame == nil) {
        NSMutableArray* array = [NSMutableArray array];
        for (int i = 0;i < self.numberOfRow;i++) {
            [array addObject:NSStringFromCGRect(CGRectZero)];
        }
        _swapCellsFrame = array;
    }
    return _swapCellsFrame;
}

-(int)colMargin{
    if (_colMargin == 0) {
        _colMargin = 8;
    }
    return _colMargin;
}

-(int)numberOfRow{
    if (_numberOfRow == 0) {
        _numberOfRow = 3;
    }
    return _numberOfRow;
}
-(int)rowMargin{
    if (_rowMargin == 0) {
        _rowMargin = 8;
    }
    return _rowMargin;
}

-(CGFloat)itemWidth{
    if (_itemWidth == 0) {
        CGFloat width =  (self.collectionView.frame.size.width - self.edgeinsets.left - self.edgeinsets.right - self.rowMargin * (self.numberOfRow - 1)) / self.numberOfRow;
        _itemWidth = width;
    }
    return _itemWidth;
}

-(CGSize)collectionViewContentSize{
    CGRect rect = CGRectFromString(self.swapCellsFrame[0]);
    CGFloat maxY = CGRectGetMaxY(rect);
    for (int i = 1; i < self.swapCellsFrame.count; i++) {
        CGRect newRect =  CGRectFromString(self.swapCellsFrame[i]);
        CGFloat newY = CGRectGetMaxY(newRect);
        if (maxY < newY) {
            maxY = newY;
        }
    }
    
    return CGSizeMake(self.collectionView.frame.size.width, maxY);
}

-(void)prepareLayout
{
    [super prepareLayout];
}
//
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}

//重新刷新
-(BOOL)shouldUpdateAttributesArray{
    return NO;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray* arrayM = [NSMutableArray array];
    self.swapCellsFrame = nil;
    //传递给collectionview的size数组
    NSMutableArray* sizeArray = [NSMutableArray array];
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        UICollectionViewLayoutAttributes* attrubute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [arrayM addObject:attrubute];
        [sizeArray addObject:NSStringFromCGSize(attrubute.frame.size)];
    }
    [self.delegate waterFallLayout:self reloadViewsSize:sizeArray];
    return arrayM;
}

//计算item的frame值
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes* attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attribute.frame = [self caculaterCellFrameWithIndexPath:indexPath];
    
//    NSLog(@"%@",NSStringFromCGRect(attribute.frame));
    return attribute;
}

-(CGRect)caculaterCellFrameWithIndexPath:(NSIndexPath*)indexPath{
    int index = 0;
    CGFloat maxY = 0;
    if (self.swapCellsFrame.count > 0) {
        CGRect rectFirst = CGRectFromString(self.swapCellsFrame[0]);
        maxY = CGRectGetMaxY(rectFirst);
        for (int i = 1; i < self.swapCellsFrame.count; i++) {
            CGRect rectNext = CGRectFromString(self.swapCellsFrame[i]);
            CGFloat newMaxY =  CGRectGetMaxY(rectNext);
            if (maxY > newMaxY) {
                index = i;
                maxY = newMaxY;
            }
        }
    }
    CGFloat height =  110;
    if ([self.delegate respondsToSelector:@selector(waterFallLayout:getItemHeightWith:andItemWidth:)]) {
       height =  [self.delegate waterFallLayout:self getItemHeightWith:indexPath andItemWidth:self.itemWidth];
    }else NSLog(@"getitemHeight协议方法未实现");
    
    CGFloat cellX = self.itemWidth*index + self.rowMargin*(index);
    CGFloat cellY = maxY + self.colMargin;
    CGRect curRect = CGRectMake(cellX, cellY, self.itemWidth, height);
    //将当前cellframe值提前之前的最低点frame值
    [self.swapCellsFrame replaceObjectAtIndex:index withObject:NSStringFromCGRect(curRect)];
    
    return curRect;
}
@end
