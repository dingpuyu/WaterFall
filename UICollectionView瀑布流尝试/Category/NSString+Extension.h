//
//  NSString+Extension.h
//  QQ聊天
//
//  Created by xiaotei on 15/8/20.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Extension)
/**
 *  扩展字符串，使其能够获得字符串所占尺寸
 */
-(CGSize)sizeWithFont:(UIFont*)font andMaxSize:(CGSize)maxSize;

@end
