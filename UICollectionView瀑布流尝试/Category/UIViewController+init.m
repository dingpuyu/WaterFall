//
//  UIViewController+init.m
//  02-视图的懒加载问题
//
//  Created by xiaotei on 15/8/21.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import "UIViewController+init.h"

@implementation UIViewController (init)
+(instancetype)controller{
    UIViewController* controller = [[self alloc]init];
    controller.view.backgroundColor = [UIColor whiteColor];
    return controller;
}
@end
