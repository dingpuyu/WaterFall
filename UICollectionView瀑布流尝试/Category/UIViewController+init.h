//
//  UIViewController+init.h
//  02-视图的懒加载问题
//
//  Created by xiaotei on 15/8/21.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (init)
/**
 *  通过将视图背景赋值为白色，取消懒加载
 *  用于创建控制器后的数据加载工作
 */
+(instancetype)controller;
@end
