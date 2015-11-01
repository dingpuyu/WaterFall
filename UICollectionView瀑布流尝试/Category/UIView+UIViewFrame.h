//
//  UIView+UIViewFrame.h
//
//  Created by xiaotei on 15/8/14.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewFrame)
//直接获得一个view的宽度
@property(nonatomic,assign)CGFloat width;
//直接获得一个view的高度
@property(nonatomic,assign)CGFloat height;

//直接获得或者设置view的x坐标
@property(nonatomic,assign)CGFloat x;
//直接获得或者设置view的y坐标
@property(nonatomic,assign)CGFloat y;
//直接获得或设置view的origin
@property(nonatomic,assign)CGPoint origin;
//直接获得或设置view的size
@property(nonatomic,assign)CGSize size;
@end
