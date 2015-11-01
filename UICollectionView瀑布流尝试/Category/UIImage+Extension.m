//
//  UIImage+Extension.m
//  
//
//  Created by xiaotei on 15/8/20.
//
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+(UIImage *)resizAbleImage:(NSString *)imageName{
    UIImage* normal = [UIImage imageNamed:imageName];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(w, h, w, h)];
}
@end
