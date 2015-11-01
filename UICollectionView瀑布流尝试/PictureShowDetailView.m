//
//  PictureShowDetailView.m
//  UICollectionView瀑布流尝试
//
//  Created by xiaotei on 15/8/27.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import "PictureShowDetailView.h"

@interface PictureShowDetailView()<UIScrollViewDelegate>
@property (nonatomic,weak)UIImageView* imageView;
@property (nonatomic,assign)CGSize imageSize;
@property (nonatomic,weak)UIView* backgroundView;
@end
@implementation PictureShowDetailView
+(instancetype)pictureShowDetailViewWithPictureName:(NSString *)pictureName{
    PictureShowDetailView* showView = [[PictureShowDetailView alloc]init];
    NSString* path = [[NSBundle mainBundle] pathForResource:pictureName ofType:nil];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    showView.imageSize = image.size;
    //背景视图初始化
    UIView* backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor grayColor];
    backView.alpha = 0.8;
    showView.backgroundView = backView;
    [showView addSubview:backView];
    
#warning 将scrollview的代理设置为自己
    showView.delegate = showView;
    
    UIImageView* imageView = [[UIImageView alloc]initWithImage:image];
    

    showView.imageView = imageView;
    [showView addSubview:imageView];
    
//    showView.contentSize = image.size;
    showView.bounces = NO;
    
    return showView;
}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    self.frame = newSuperview.bounds;
    
    self.backgroundColor = [UIColor clearColor];
    self.backgroundView.frame = newSuperview.bounds;

    
    //点击事件监听，双击退出
    UITapGestureRecognizer* scrollViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTouch)];
    scrollViewTap.numberOfTapsRequired = 1;
    self.backgroundColor = [UIColor colorWithRed:0.60f green:0.60f blue:0.60f alpha:0.8f];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:scrollViewTap];
    
    self.minimumZoomScale = 1.0f;
    self.maximumZoomScale = 5.0f;
    self.contentSize = self.imageSize;
    
//    拖动事件监听
    UIPanGestureRecognizer* imageViewPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewPan:)];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:imageViewPan];
    
    CGFloat imvW = newSuperview.frame.size.width;
    CGFloat imvH = imvW / self.imageSize.width * self.imageSize.height;
    
    imvH = imvH >= newSuperview.frame.size.height?imvH - 50:imvH;
    self.imageView.frame = CGRectMake(0, 0, imvW, imvH);
    
    NSLog(@"%f",self.imageView.alpha);
    
    CGRect rect = self.frame;
    rect.size.width = imvW * 5;
    rect.size.height = imvH * 5;
    self.frame = rect;
    
//    self.center = newSuperview.center;
    self.imageView.center = newSuperview.center;
}

-(void)imageViewPan:(UIPanGestureRecognizer*)recognizer{
    CGPoint translation = [recognizer translationInView:self.imageView];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointZero inView:self.imageView];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    CGRect rect = self.frame;
    rect.size.width += offset.x;
    rect.size.height += offset.y;
    
    self.frame = rect;
    
    NSLog(@"scrollViewDidScroll:%@",NSStringFromCGPoint(scrollView.contentOffset));
}

-(void)scrollViewTouch{
    [self removeFromSuperview];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//    NSLog(@"%f",self.imageView.frame.size.width);
//    self.imageView.center = self.center;
    return self.imageView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
