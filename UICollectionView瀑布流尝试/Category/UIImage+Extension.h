//
//  UIImage+Extension.h
//  
//
//  Created by xiaotei on 15/8/20.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  返回一个可自适应大小的图片
 *
 *  @param imageName 图片名字
 *
 *  @return 一个可变大小的图片对象
 */
+(UIImage*)resizAbleImage:(NSString*)imageName;

@end
