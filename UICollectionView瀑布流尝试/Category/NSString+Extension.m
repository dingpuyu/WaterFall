//
//  NSString+Extension.m
//  QQ聊天
//
//  Created by xiaotei on 15/8/20.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
//返回文本大小
-(CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize{
    NSDictionary* attribute = @{NSFontAttributeName:font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
}
@end
